#!/usr/bin/env python3

from addr import *
import socket, sys
import pickle

# Main class which creates the Shell commands
class Nanonet(object):
	def __init__(self, topo, linknet=None, loopnet=None):
		self.topo = topo
		self.orig_topo = topo

		if linknet is None:
			linknet = V6Net('fc00:42::', 32, 64)

		if loopnet is None:
			loopnet = V6Net('fc00:2::', 32, 64)

		self.linknet = linknet
		self.loopnet = loopnet

	# Load a serialized python object
	# Currently not used.
	@staticmethod
	def load(fname):
		f = open(fname, 'r')
		obj = pickle.load(f)
		f.close()
		return obj

	# Assign the IPs to the interfaces (both node loopbacks and edge loopbacks)
	def assign(self):
		for e in self.topo.edges:
			enet = self.linknet.next_net()
			a1 = enet[:]
			a2 = enet[:]
			a1[-1] = 1
			a2[-1] = 2

#			print 'Assigning %s - %s' % (socket.inet_ntop(socket.AF_INET6, str(a1)), socket.inet_ntop(socket.AF_INET6, str(a2)))
#			print 'With submask %d' % self.linknet.submask
#			print e.port1
#			print e.port2
#			print 'For port1 %d and port2 %d' % (e.port1, e.port2)

			e.node1.intfs_addr[e.port1] = socket.inet_ntop(socket.AF_INET6, a1)+'/'+str(self.linknet.submask)
			e.node2.intfs_addr[e.port2] = socket.inet_ntop(socket.AF_INET6, a2)+'/'+str(self.linknet.submask)

		for n in self.topo.nodes:
			enet = self.loopnet.next_net()
			enet[-1] = 1

			n.addr = socket.inet_ntop(socket.AF_INET6, enet)+'/'+str(self.loopnet.submask)

	# Start algorithm
	# Builds the topology, runs Dijkstra and
	def start(self, netname=None):
		print ('# Building topology...')
		self.topo.build()
		print ('# Assigning prefixes...')
		self.assign()

		print ('# Running dijkstra... (%d nodes)' % len(self.topo.nodes))
		self.topo.compute()

		# Allows also accessing the routing information.
		self.topo.dijkstra_computed()

		# Serialize into file
		# Currently not used.
		if netname is not None:
			f = open(netname, 'w')
			pickle.dump(self, f)
			f.close()

	# Currently not used.
	def call(self, cmd):
		sys.stdout.write('%s\n' % cmd)

	# Generate the Shell commands.
	# Note: Removed default parameter from wr
	def dump_commands(self, write_lambda, noroute=False):
		host_cmd = []
		node_cmd = {}

		write_lambda("%s" % self.bash_query())

		# Create network namespace for each node
		for n in self.topo.nodes:
			host_cmd.append('ip netns add %s' % n.name)
			node_cmd[n] = []
			node_cmd[n].append(('ifconfig lo up', False))
			node_cmd[n].append(('ip -6 ad ad %s dev lo' % n.addr, False))
			node_cmd[n].append(('sysctl net.ipv6.conf.all.forwarding=1', False))
			node_cmd[n].append(('sysctl net.ipv6.conf.all.seg6_enabled=1', False))

		# Connect together the namespaces, create the links etc.
		already_printed = []
		for e in self.topo.edges:
			dev1 = '%s-%d' % (e.node1.name, e.port1)
			dev2 = '%s-%d' % (e.node2.name, e.port2)

			node_cmd[e.node1].append(('# Edge %s - %s' % (e.node1.name, e.node2.name), False))

			# Configure links between the namespaces
			# host commands must only be printed ONCE
			# so check if the edge in the other direction has not been traversed
			if not list(filter(lambda edge: e.node1 == edge.node2 and e.node2 == edge.node1, already_printed)):
				host_cmd.append('ip link add name %s type veth peer name %s' % (dev1, dev2))
				host_cmd.append('ip link set %s netns %s' % (dev1, e.node1.name))
				host_cmd.append('ip link set %s netns %s' % (dev2, e.node2.name))
			already_printed.append(e)

			# Conficure interfaces
			node_cmd[e.node1].append(('ifconfig %s add %s up' % (dev1, e.node1.intfs_addr[e.port1]), False))
			node_cmd[e.node1].append(('sysctl net.ipv6.conf.%s.seg6_enabled=1' % (dev1), False))
			if not e.directed:
				node_cmd[e.node2].append(('ifconfig %s add %s up' % (dev2, e.node2.intfs_addr[e.port2]), False))
				node_cmd[e.node2].append(('sysctl net.ipv6.conf.%s.seg6_enabled=1' % (dev2), False))

			# Delay
			if e.delay > 0 and e.bw == 0:
				node_cmd[e.node1].append(('tc qdisc add dev %s root handle 1: netem delay %.2fms' % (dev1, e.delay), False))
				if not e.directed:
					node_cmd[e.node2].append(('tc qdisc add dev %s root handle 1: netem delay %.2fms' % (dev2, e.delay), False))
			elif e.bw > 0:
				# Bandwidth
				node_cmd[e.node1].append(('tc qdisc add dev %s root handle 1: htb' % (dev1), False))
				node_cmd[e.node1].append(('tc class add dev %s parent 1: classid 1:1 htb rate %dkbit ceil %dkbit' % (dev1, e.bw, e.bw), False))
				node_cmd[e.node1].append(('tc filter add dev %s protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1' % (dev1), False))
				if not e.directed:
					node_cmd[e.node2].append(('tc qdisc add dev %s root handle 1: htb' % (dev2), False))
					node_cmd[e.node2].append(('tc class add dev %s parent 1: classid 1:1 htb rate %dkbit ceil %dkbit' % (dev2, e.bw, e.bw), False))
					node_cmd[e.node2].append(('tc filter add dev %s protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1' % (dev2), False))
				if e.delay > 0:
					node_cmd[e.node1].append(('tc qdisc add dev %s parent 1:1 handle 10: netem delay %.2fms' % (dev1, e.delay), False))
					if not e.directed:
						node_cmd[e.node2].append(('tc qdisc add dev %s parent 1:1 handle 10: netem delay %.2fms' % (dev2, e.delay), False))

		# Create routes between the namespaces
		if not noroute:
			for n in self.topo.nodes:
				for dst in n.routes.keys():
					rts = n.routes[dst]
					laddr = n.addr.split('/')[0]
					if len(rts) == 1:
						r = rts[0]
						node_cmd[n].append(('ip -6 ro ad %s via %s metric %d src %s' % (r.dst, r.nh, r.cost, laddr), False))
					else:
						allnh = ''
						for r in rts:
							allnh += 'nexthop via %s weight 1 ' % (r.nh)
						node_cmd[n].append(('ip -6 ro ad %s metric %d src %s %s' % (r.dst, r.cost, laddr, allnh), False))

		# Add additional commands per node
		for n in self.topo.nodes:
			for c in self.topo.get_node(n.name).additional_commands:
				command = self.topo.process_strings(c[0])
				node_cmd[n].append((command, c[1]))

		# Write host commands line per line
		for c in host_cmd:
			write_lambda('%s' % c)

		# Print one command per line instead of all in one line
		for n in node_cmd.keys():
			write_lambda('')
			write_lambda(f'# Commands for namespace {n.name}')
			for cmds in node_cmd[n]:
				if not cmds[1]:
					write_lambda('ip netns exec %s bash -c \'%s\'' % (n.name, cmds[0]))
				else:
					write_lambda('ip netns exec %s bash -c \"%s\"' % (n.name, cmds[0]))
			#wr('ip netns exec %s bash -c \'%s\'' % (n.name, "; ".join(node_cmd[n])))


	def bash_query(self):
		IFCMD = "if [ \"$1\" == \"%s\" ]; then echo %s ; fi ; "
		output = ""
		output += 'PYTHON_CURR_DIR=`dirname $0`\n'
		output += 'if [ "$1" == "--query" ]; then shift; '
		for n1 in self.topo.nodes:
			output += (IFCMD % (n1.name, self.topo.process_strings("{" + n1.name + "}")))
			for n2 in self.topo.nodes:
				if n1.name == n2.name:
					continue

				# Try catch because throws an exception if nodes are not adjacent
				try:
					output += (IFCMD % ("ifname ("+n1.name+","+n2.name+") at "+n1.name,
										self.topo.process_strings("{ifname ("+n1.name+","+n2.name+") at "+n1.name+"}")))
				except:
					pass
				try:
					output += (IFCMD % ("ifname (" + n1.name + "," + n2.name + ") at " + n2.name,
										self.topo.process_strings("{ifname ("+n1.name+","+n2.name+") at "+n2.name+"}")))
				except:
					pass
				try:
					output += (IFCMD % ("edge (" + n1.name + "," + n2.name + ") at " + n1.name,
										self.topo.process_strings("{edge (" + n1.name + "," + n2.name + ") at " + n1.name + "}")))
				except:
					pass
				try:
					output += (IFCMD % ("edge (" + n1.name + "," + n2.name + ") at " + n2.name,
										self.topo.process_strings("{edge (" + n1.name + "," + n2.name + ") at " + n2.name + "}")))
				except:
					pass

		output += "exit; fi\n"

		# Remove namespaces with "--stop" option
		output += "if [ \"$1\" == \"--stop\" ]; then "

		# Stop throughput
		if self.topo.throughput_enabled:
			for namespace in self.topo.nodes:
				output += f'ip netns exec {namespace.name} bash -c "${{PYTHON_CURR_DIR}}/throughput.py -e -i {namespace.name}.throughput.json -o {namespace.name}.throughput.json" ; '

		# Stop all processes of the namespace and remove the namespace itself
		for namespace in self.topo.nodes:
			output += f"ip netns pids {namespace.name} | xargs kill -n 9 ; "
			output += f"ip netns del {namespace.name} ; "
		output += " exit ; "
		output += " fi \n"

		# ifdown and ifup
		# Syntax:
		# --link "edge (R1,R2)" {down,up}
		# will then execute "ifconfig {R1-X,R2-X} {down,up}" at the respective namespace
		output += 'if [ "$1" == "--link" ]; then shift; '
		output += "if false; then :; "
		for node1 in self.topo.nodes:
			for node2 in self.topo.nodes:
				if node1.name != node2.name:
					edge = self.topo.get_minimal_edge(node1, node2)
					if (not edge):
						continue
					output += f' elif [ "$1" == "edge ({node1.name},{node2.name})" ]; then '
					output += f' ip netns exec {edge.node1.name} bash -c "ifconfig {edge.node1.name}-{edge.port1} $2 " ; '
					output += f' ip netns exec {edge.node2.name} bash -c "ifconfig {edge.node2.name}-{edge.port2} $2 " ; '
					for (node,cmd,mode) in edge.restart_commands:
						output += f" if [ $2 == '{mode}' ]; then ip netns exec {node} bash -c '{self.topo.process_strings(cmd)}'; fi ; "
		output += " fi;  exit; "
		output += " fi \n"

		output += "set -x \n\n"

		return output

	# Remove some routes (TODO: why???)
	# Currently not used.
	def igp_prepare_link_down(self, name1, name2):
		t = self.topo.copy()

		edge = t.get_minimal_edge(t.get_node(name1), t.get_node(name2))
		t.edges.remove(edge)
		t.compute()

		rm_routes = {}
		chg_routes = {}
		for n in self.topo.nodes:
			n2 = t.get_node(n.name)
			rm_routes[n2] = []
			chg_routes[n2] = []

			for r in n.routes:
				if r not in n2.routes:
					rm_routes[n2].append(r)
					continue
				r2 = n2.routes[n2.routes.index(r)]
				if r.nh != r2.nh or r.cost != r2.cost:
					chg_routes[n2].append(r2)

		return (t, edge, rm_routes, chg_routes)

#		for n in rm_routes.keys():
#			print '# Removed routes for node %s:' % n.name
#			for r in rm_routes[n]:
#				print '# %s via %s metric %d' % (r.dst, r.nh, r.cost)
#		for n in chg_routes.keys():
#			print '# Changed routes for node %s:' % n.name
#			for r in chg_routes[n]:
#				print '# %s via %s metric %d' % (r.dst, r.nh, r.cost)

	# Remove some routes (TODO: why???)
	# Currently not used.
	def igp_apply_link_down(self, edge, rm_routes, chg_routes, timer=50):
		n1, n2 = edge.node1, edge.node2

		S = set()
		Q = set(self.topo.nodes)
		visited = set()
		S.add(n1)
		S.add(n2)

		# shut down interfaces
		self.call('ip netns exec %s ifconfig %s-%d down' % (n1.name, n1.name, edge.port1))
		self.call('ip netns exec %s ifconfig %s-%d down' % (n2.name, n2.name, edge.port2))

		while len(Q) > 0:
			S2 = set()
			self.call('sleep %f' % (timer/1000.0))
			for n in S:
				for r in rm_routes[n]:
					self.call('ip netns exec %s ip -6 ro del %s' % (n.name, r.dst))
				for r in chg_routes[n]:
					self.call('ip netns exec %s ip -6 ro replace %s via %s metric %d' % (n.name, r.dst, r.nh, r.cost))
				visited.add(n)
				S2.update(self.topo.get_neighbors(n))
				S2.difference_update(visited)
				Q.remove(n)
			S = S2

	def apply_topo(self, t):
		self.topo = t
