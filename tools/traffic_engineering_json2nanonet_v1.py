#!/usr/bin/env python3

import json
import math
import subprocess
from sys import stderr, argv, exit
from os import path

# Factors for align the comma values of the JSON file
# Please note, that CAPACITY and DEMAND are both in KB.
WEIGHT_FACTOR   =   1000
CAPACITY_FACTOR = 1000000000000
DEMAND_FACTOR   = 100000
# Please note: CAPACITY_FACTOR and DEMAND_FACTOR should ALWAYS be the same value!!!
if CAPACITY_FACTOR != DEMAND_FACTOR:
    stderr.write("WARNING: CAPACITY_FACTOR does not match DEMAND_FACTOR!\n")

# Number of streams that are started. These streams are hashed individually.
NSTREAMS =  32
TIME     = 300


# CONVERT TO OCTAVE function
# This snipped extracts the demands in the JSON file to a matrix, readable in Octave or Matlab
if len(argv) >= 2 and argv[1] == "--octave":
    filename = "/dev/stdin"
    if len(argv) == 3:
        filename = argv[2]
    # Parse JSON file
    with open(filename) as json_file:
        data = json.load(json_file)

    for demand in data["demands"]:
        print(f'D({demand["src"] + 1},{demand["dst"] + 1}) = {int(demand["demand_size"] * DEMAND_FACTOR)};')

    exit(0)
# END CONVERT TO OCTAVE function


# GET MAXIMUM
if len(argv) >= 2 and argv[1] == "--getutilization":

    json_filename = ""
    script_filename = ""
    if len(argv) == 4:
        json_filename = argv[2]
        script_filename = argv[3]
    else:
        print("Usage: ./traffic_engineering_json2nanonet_v1.py json_filename.json script_filename.topo.sh")
        exit(1)
    # Parse JSON file
    data = dict()
    with open(json_filename) as json_file:
        data = json.load(json_file)

    dirname = "./"
    if( json_filename != "/dev/stdin" ):
        dirname = path.dirname(json_filename) + "/"

    for demand in data["demands"]:
        flow_filename = dirname + f'flow-{demand["index"]}_{demand["src"]}-{demand["dst"]}.txt.csv'
        try:
            sum = 0.0
            with open(flow_filename) as csvfile:
                line = csvfile.readline()
                if not line:
                    break
                sum += float(line.split(',')[3])
                pass
            print(f'SUM({demand["index"]},{demand["src"]},{demand["dst"]}) = {sum}')
            print(f'ORIG({demand["index"]},{demand["src"]},{demand["dst"]}) = {demand["demand_size"]*DEMAND_FACTOR}')
            print(f'R({demand["index"]},{demand["src"]},{demand["dst"]}) = {sum / (demand["demand_size"]*DEMAND_FACTOR) * 10**4}')
        except Exception:
            # Ignore non-existing files
            pass
        pass
        #print(f'D({demand["src"] + 1},{demand["dst"] + 1}) = {int(demand["demand_size"] * DEMAND_FACTOR)};')

    for link in data["links"]:
        # query interface names
        process1 = subprocess.run(
            ['bash',script_filename, '--query', f'ifname ({link["i"]},{link["j"]}) at {link["i"]}'],
            stdout=subprocess.PIPE)
        process2 = subprocess.run(
            ['bash', script_filename, '--query', f'ifname ({link["i"]},{link["j"]}) at {link["j"]}'],
            stdout=subprocess.PIPE)
        print(f'C({link["i"]},{link["j"]}) = {link["capacity"]}')
        ifname1 = process1.stdout.strip().decode('ascii')
        ifname2 = process2.stdout.strip().decode('ascii')

        with \
                open(dirname+f'{link["i"]}.throughput.json') as throughputfile1, \
                open(dirname+f'{link["j"]}.throughput.json') as throughputfile2:
            throughput1 = json.load(throughputfile1)
            throughput2 = json.load(throughputfile2)
            # Get throughput; if not exists, write -1
            print(f"T({link['i']},{link['j']}) = "
                  f"({throughput1.get(ifname1,dict()).get('recv_bytes',-1)},"
                  f"{throughput2.get(ifname2,dict()).get('recv_bytes',-1)})")

            print(f"S({link['i']},{link['j']}) = {(throughput1.get(ifname1,dict()).get('recv_bytes',0)/10**6)/(TIME*link['capacity'])}")
        pass

    exit(0)
# END


filename = "/dev/stdin"
topo_name = "Thomas"
if len(argv) >= 2:
    filename = argv[1]
if len(argv) >= 3:
    topo_name = argv[2]

nodes = []
destination_nodes = []

# Parse JSON file
with open(filename) as json_file:
    data = json.load(json_file)

output = f"""
#!/usr/bin/env python
from node import *

class {topo_name}(Topo):
    def build(self):
"""

# Get all node names and create the nodes
for node in data["links"]:
    nodes.append(node["i"])
    nodes.append(node["j"])
nodes = list(set(nodes))

# get destinations
for node in data["demands"]:
    destination_nodes.append(node["dst"])
destination_nodes = list(set(destination_nodes))

for n in nodes:
    output += \
f"""\
        self.add_node("{n}")
"""

"""
# Make edges unidirectional
# as required from nanonet
for edge1 in data["links"]:
    for edge2 in data["links"]:
        if( edge1["i"] == edge2["i"] and edge1["j"] == edge2["j"] ):
            continue
        if(edge1["i"] == edge2["j"] and edge1["j"] == edge2["i"]):
            # TODO: Remove round()
            if(round(edge1["weight"]) != round(edge2["weight"]) or edge1["capacity"] != edge2["capacity"]):
                raise Exception(f'Wrong input format -- link {edge1["i"]} -- {edge2["j"]} -- properties differ.')
            data["links"].remove(edge2)
"""

for edge in data["links"]:
    output += \
f"""\
        self.add_link_name("{edge["i"]}", "{edge["j"]}", cost={math.ceil(edge["weight"]*WEIGHT_FACTOR)}, delay=0.2, bw={edge["capacity"]*CAPACITY_FACTOR}, directed=True)
"""

output += \
f"""\
    
    def dijkstra_computed(self):
"""
# Create routes out of the demands
for routes in data["demands"]:
    segs = ""
    # We do not want the last element
    for s in routes["segments"][1:-1]:
        segs += f"{{{s}}},"
    if len(routes["segments"]) >= 2:
        if routes['segments'][-1] == routes["dst"]:
            segs += f"{{{routes['segments'][-2]}}}"
        else:
            segs += f"{{{routes['segments'][-1]}}}"
    if segs:
        output += \
f"""\
        # Demand from {routes["src"]} to {routes["dst"]}
        self.add_command("{routes["src"]}", "ip -6 route add {{{routes["dst"]}}} {f'encap seg6 mode encap segs {segs}' if segs else ''} via "+self.get_dijkstra_route_by_name("{str(routes["src"])}","{str(routes['segments'][0])}")[0].nh+" metric 1 src {{{routes["src"]}}}")
"""

# Start nuttcp at destination nodes
for n in destination_nodes:
    output += \
f"""\
        self.add_command("{n}", "nuttcp -6 -S")
"""
for demand in data["demands"]:
    output += \
f"""\
        self.add_command("{demand["src"]}", 'echo bash -c \\\\\\\"START=\\\\\\\\\\$SECONDS\; while \! ip netns exec {demand["src"]} nuttcp -T{TIME} -i1 -R{int(demand["demand_size"]*DEMAND_FACTOR)} -N{NSTREAMS} {{{demand["dst"]}}} \>\>flow-{demand["index"]}_{demand["src"]}-{demand["dst"]}.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\\\\\\\\$SECONDS \>\>flow-{demand["index"]}_{demand["src"]}-{demand["dst"]}.txt\; done\\\\\\\" | at now+2min')
"""

output += """
        self.enable_throughput()
"""

output += f"""
topos = {{'{topo_name}': (lambda: {topo_name}())}}
"""

print(output)