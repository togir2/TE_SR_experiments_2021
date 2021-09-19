#!/usr/bin/env python3

import json
import math
from sys import stderr, argv

# Factors for align the comma values of the JSON file
# Please note, that CAPACITY and DEMAND are both in KB.
WEIGHT_FACTOR   =   1000
CAPACITY_FACTOR = 1000000000000
DEMAND_FACTOR   = 10000
# Please note: CAPACITY_FACTOR and DEMAND_FACTOR should ALWAYS be the same value!!!
if CAPACITY_FACTOR != DEMAND_FACTOR:
    stderr.write("WARNING: CAPACITY_FACTOR does not match DEMAND_FACTOR!\n")

# Number of streams that are started. These streams are hashed individually.
NSTREAMS =  32 # parallel streams
TIME     = 300 # seconds

filename = "/dev/stdin"
topo_name = "TestTopo"
if len(argv) >= 2:
    filename = argv[1]
if len(argv) >= 3:
    topo_name = argv[2]

nodes = []
destination_nodes = []
source_nodes = []

# Parse JSON file
with open(filename) as json_file:
    data = json.load(json_file)

output = f"""
#!/usr/bin/env python3
from node import *

class {topo_name}(Topo):
    def build(self):
"""

# Get all node names and create the nodes
for node in data["links"]:
    nodes.append(node["i"])
    nodes.append(node["j"])
nodes = list(set(nodes))

# get destinations and sources
for node in data["demands"]:
    destination_nodes.append(node["dst"])
    source_nodes.append(node["src"])
destination_nodes = list(set(destination_nodes))
source_nodes = list(set(source_nodes))

# Add the nodes
for n in nodes:
    output += \
f"""\
        self.add_node("{n}")
"""

# Set the links between the nodes
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
    route_cmd = f"""f\"ip -6 route add {{{{{routes["dst"]}}}}} metric 1 table 1 src {{{{{routes["src"]}}}}} """
    build_str = f"""build_str = \"\""""
    for seg in routes["waypoint_chance_map"]:
        build_str += f"""
        nhlist = self.get_dijkstra_route_by_name("{str(routes["src"])}","{str(seg)}")
        for nh in nhlist:
            build_str += f" nexthop via {{nh.nh}} \""""
        #route_cmd += f""" nexthop via "+self.get_dijkstra_route_by_name("{str(routes["src"])}","{str(seg)}")[0].nh +\""""
        if str(seg) != str(routes['dst']):
            build_str += f"""+" encap seg6 mode inline segs {{{str(seg)}}} \""""
        build_str += f"""+ f" weight {{int({int(routes["waypoint_chance_map"][str(seg)]*100)}/len(nhlist))}} \""""
    route_cmd += " {build_str}\""
    output += \
f"""\
        # Demand from {routes["src"]} to {routes["dst"]}
        {build_str}
        self.add_command("{routes["src"]}", {route_cmd})
"""

# Policy rule s.t. local traffic (possibly) uses segments but the other traffic does not.
for demand in data['demands']:
    output += \
f"""\
        self.add_command("{demand['src']}", "ip -6 rule add to {{{demand['dst']}/}} iif lo table 1")
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
        self.add_command("{demand["src"]}", 'echo bash -c \\\\\\\"START=\\\\\\\\\\$SECONDS\; while \! ip netns exec {demand["src"]} nuttcp -T{TIME} -i1 -R{int(demand["demand_size"]*DEMAND_FACTOR)} -N{NSTREAMS} {{{demand["dst"]}}} \>\>flow_{demand["src"]}-{demand["dst"]}.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\\\\\\\\$SECONDS \>\>flow_{demand["src"]}-{demand["dst"]}.txt\; done\\\\\\\" | at now+2min')
"""

output += """
        self.enable_throughput()
"""

# Use L4 hash
for n in nodes:
    output += f"""\
        self.add_command("{n}", "sysctl net.ipv6.fib_multipath_hash_policy=1")
"""

output += f"""
topos = {{'{topo_name}': (lambda: {topo_name}())}}
"""

print(output)
