#!/usr/bin/env python3

import sys, os
from node import *
from net import *

# Main file
# Usage:
# ./build.py topos/file.py toponame [outdir]
# custom exec inspired by mininet

def usage():
	print ('Usage: %s topofile.py toponame [outdir]' % (sys.argv[0]))
	sys.exit(-1)

# Print usage in case of wrong arguments
if len(sys.argv) < 3 or len(sys.argv) > 4:
	usage()

outdir='.'
if len(sys.argv) == 4:
	outdir = sys.argv[3]

topos = {}

sys.path.append('.')

# Open and parse the topology python file, which was given via command line option
customs = {}
with open(sys.argv[1]) as f:
	code = compile(f.read(), sys.argv[1], 'exec')
	exec(code, customs, customs)

# ???
for name, val in customs.items():
	if name == 'topos':
		globals()['topos'].update(val)
	else:
		globals()[name] = val
print(topos)
topo = topos[sys.argv[2]]()

os.chdir(outdir)

net = Nanonet(topo)
net.start()

# Print topology commands to output file.
f = open(sys.argv[2]+'.topo.sh', 'w')

for n in net.topo.nodes:
	f.write('# %s loop: %s\n' % (n.name, n.addr))
f.write('\n')

net.dump_commands(lambda x: f.write('%s\n' % x), noroute=topo.noroute)
f.close()
