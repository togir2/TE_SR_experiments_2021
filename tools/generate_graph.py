#!/usr/bin/env python3

# Generates a graph (as a *.dot file) from a JSON file.

import json
from sys import stderr, argv

# Factors for align the comma values of the JSON file
WEIGHT_FACTOR   =   1000
CAPACITY_FACTOR = 10000000
DEMAND_FACTOR   = 10000000
# Please note: CAPACITY_FACTOR and DEMAND_FACTOR should ALWAYS be the same value!!!
if CAPACITY_FACTOR != DEMAND_FACTOR:
    stderr.write("WARNING: CAPACITY_FACTOR does not match DEMAND_FACTOR!")

filename = "/dev/stdin"
if len(argv) >= 2:
    filename = argv[1]

# Parse JSON file
with open(filename) as json_file:
    data = json.load(json_file)

# Get all node names and create the nodes
nodes = []
for node in data["links"]:
    nodes.append(node["i"])
    nodes.append(node["j"])
nodes = list(set(nodes))

colors = ['red', 'yellow', 'purple', 'darkgreen', 'brown', 'blue', 'lightblue', 'orange', 'magenta', 'cyan', 'pink']

print("""
digraph Topology {
""")
for node in nodes:
    print(f'\t{node} [shape=circle]')

already_printed = []
for link in data["links"]:
    #if list(filter( lambda l: l['i'] == link['j'] and l['j'] == link['i'] and link['capacity'] != l['capacity'] and link['weight'] != l['weight'],already_printed)):
    if link["capacity"] == 40 and link["weight"] == 1:
        print(f'\t{link["i"]} -> {link["j"]} [dir=none,label=<<table border="0"><tr><td><font color="red">{link["capacity"]}</font></td></tr><tr><td><font color="green">{link["weight"]}</font></td></tr></table>>, color=gray ]')
        #data['links'] = list(filter(lambda l: l['j'] == link['i'] and l['i'] == link['j'],data['links']))
    else:
        print(f'\t{link["i"]} -> {link["j"]} [label=<<table border="0"><tr><td><font color="red">{link["capacity"]}</font></td></tr><tr><td><font color="green">{link["weight"]}</font></td></tr></table>> ]')

i = 0
for demand in data["demands"]:
    segs = '-> '
    for seg in demand["segments"][:-1]:
        segs = segs +  str(seg) + ' -> '

    print(f'\t{demand["src"]} {segs} {demand["dst"]} [label="{demand["index"]}", color="{colors[i%len(colors)]}" ]')
    i = i+1

print("}")