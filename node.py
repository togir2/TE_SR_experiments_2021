#!/usr/bin/env python3
import re
from route import *
import copy, random

def normalize(name):
	if len(name) > 12:
		return name[-12:]
	return name

class Node(object):
	def __init__(self, name):
		self.name = name
		self.cur_intf = 0
		self.intfs = []
		self.intfs_addr = {}
		self.addr = None

		self.routes = {}

		# Add additional commands, like one to start nuttcp
		self.additional_commands = []

	def add_route(self, r):
		if r.dst not in self.routes.keys():
			self.routes[r.dst] = [r]
		else:
			self.routes[r.dst].append(r)

	def add_intf(self, intf):
		self.intfs.append(intf)

	def new_intf(self):
		i = self.cur_intf
		self.cur_intf += 1
		return i

	def get_portaddr(self, intf):
		return self.intfs_addr[intf].split("/")[0]

	# Add an additional command
	def add_command(self, command, eval=False):
		self.additional_commands.append((command, eval))

	def __hash__(self):
		return self.name.__hash__()

	def __eq__(self, o):
		return self.name == o.name

class Edge(object):
	def __init__(self, node1, node2, port1, port2, cost, delay, bw, directed=False):
		self.node1 = node1
		self.node2 = node2
		self.port1 = port1
		self.port2 = port2
		self.cost = cost
		self.delay = delay
		self.bw = bw
		# Commands that are executed when the link is restarted again.
		# They are written in a tuple, as (node,cmd,mode)
		self.restart_commands = []
		# If the edge is directed of not
		self.directed = directed

	def add_restart_command(self, node, cmd, mode='up'):
		self.restart_commands.append((node, cmd, mode))

class Topo(object):
	def __init__(self):
		self.nodes = set()
		self.edges = list()
		self.dmin = 0
		self.dmax = 0
		self.noroute = False
		self.throughput_enabled = False

	def copy(self):
		t = Topo()
		t.nodes = copy.deepcopy(self.nodes)
		t.edges = copy.deepcopy(self.edges)

		for e in t.edges:
			e.node1 = t.get_node(e.node1.name)
			e.node2 = t.get_node(e.node2.name)

		return t

	def copy_unit(self):
		t = self.copy()

		for e in t.edges:
			e.cost = 1

		t.compute()
		return t

	def build(self):
		pass

	def dijkstra_computed(self):
		pass

	def add_node(self, name):
		n = Node(normalize(name))
		self.nodes.add(n)
		return n

	def get_node(self, name):
		for n in self.nodes:
			if n.name == normalize(name):
				return n

		return None

	def add_link(self, node1, node2, port1=None, port2=None, cost=1, delay=None, bw=None, directed=False):
		# If the edges are directed, the interface names should be the same
		# so, query for the interface names ...
		existing_edge = list(filter( lambda e: e.node1 == node2 and e.node2 == node1, self.edges))
		if port1 is None:
			if existing_edge:
				port1 = existing_edge[0].port2
			else:
				port1 = node1.new_intf()
		if port2 is None:
			if existing_edge:
				port2 = existing_edge[0].port1
			else:
				port2 = node2.new_intf()

		node1.add_intf(port1)
		node2.add_intf(port2)

		if delay is None:
			delay = random.uniform(self.dmin, self.dmax)

		e = Edge(node1, node2, port1, port2, int(cost), delay, bw, directed)
		self.edges.append(e)
		return e

	def add_link_name(self, name1, name2, *args, **kwargs):
		return self.add_link(self.get_node(name1), self.get_node(name2), *args, **kwargs)

	# Add a custom command
	def add_command(self, node, command, eval=False):
		lnode = self.get_node(node)
		if(lnode is not None):
			lnode.add_command(command, eval=eval)

	# Throughput starting
	# NOTE: Ending must be done separately.
	def enable_throughput(self):
		for n in self.nodes:
			self.add_command(n.name, f"${{PYTHON_CURR_DIR}}/throughput.py -o {n.name}.throughput.json -s", eval=True)
		self.throughput_enabled = True

	# Return dijkstra route from src to dst
	def get_dijkstra_route_by_name(self, src_name, dst_name):
		return self.get_node(src_name).routes[self.get_node(dst_name).addr]

	# Replace {} expressions in strings
	def process_strings(self, command):
		# Replace {N} in the command strings
		# get all node-names to be replaced
		to_be_replaced = [x[1: -1] for x in re.findall(r'{[a-zA-Z0-9\-]+/*}', command)]

		# syntax "{edge (...,...) at ...}"
		while re.search(r'{edge\s*\(\s*[a-zA-Z0-9]+\s*,\s*[a-zA-Z0-9]+\s*\)\s*at\s+[a-zA-Z0-9]+\s*}', command):
			data = re.search(r'{edge\s*\(\s*[a-zA-Z0-9]+\s*,\s*[a-zA-Z0-9]+\s*\)\s*at\s+[a-zA-Z0-9]+\s*}',
							 command).group()
			# get edge points as array, inside the "(...)"
			edge_points = list(filter(None, re.split(r"[, ]", data[data.find("(") + 1: data.find(")")])))
			# get vertex
			at = data[data.rfind(" ") + 1:-1]
			# the other
			other = list(filter(lambda v: not v == at, edge_points))[0]

			edge = self.get_minimal_edge(self.get_node(at), self.get_node(other))
			addr = ""
			if (not edge):
				raise Exception("Error parsing ", command)
			if (edge.node1.name == at):
				# print(edge.node1.intfs_addr)
				addr = edge.node1.intfs_addr[edge.port1]
			elif (edge.node2.name == at):
				# print(edge.node2.intfs_addr)
				addr = edge.node2.intfs_addr[edge.port2]
			else:
				raise Exception("Error parsing ", command)

			# Substitute edge address (and remove the netmask)
			command = command.replace(data, re.sub(r'/[\d]+', '', addr))
		# extract interface name
		while re.search(r'{ifname\s*\(\s*[a-zA-Z0-9]+\s*,\s*[a-zA-Z0-9]+\s*\)\s*at\s+[a-zA-Z0-9]+\s*}', command):
			data = re.search(r'{ifname\s*\(\s*[a-zA-Z0-9]+\s*,\s*[a-zA-Z0-9]+\s*\)\s*at\s+[a-zA-Z0-9]+\s*}',
							 command).group()
			# get edge points as array, inside the "(...)"
			edge_points = list(filter(None, re.split(r"[, ]", data[data.find("(") + 1: data.find(")")])))
			# get vertex
			at = data[data.rfind(" ") + 1:-1]
			# the other
			other = list(filter(lambda v: not v == at, edge_points))[0]

			edge = self.get_minimal_edge(self.get_node(at), self.get_node(other))
			addr = ""
			if (not edge):
				raise Exception("Error parsing ", command)
			if (edge.node1.name == at):
				# print(edge.node1.intfs_addr)
				addr = edge.node1.name + "-" + str(edge.port1)
			elif (edge.node2.name == at):
				# print(edge.node2.intfs_addr)
				addr = edge.node2.name + "-" + str(edge.port2)
			else:
				raise Exception("Error parsing ", command)
			# Substitute edge interface
			command = command.replace(data, addr)

		# find ip addresses
		for node_name in to_be_replaced:
			node = self.get_node(re.sub(r'-[\d]+$', '', node_name.replace("/", "")))
			# No node with this name ...
			if not node:
				continue

			# Choose either interface address or node address
			if re.search(r'-[\d]+$', node_name):
				interface_number = re.findall(r'-[\d]+$', node_name)[-1][1:]
				addr = node.intfs_addr[int(interface_number)]
			else:
				addr = node.addr
			# If tailing / is given, include netmask, else skip
			if (node_name.find('/') == -1):
				command = command.replace("{" + node_name + "}", re.sub(r'/[\d]+', '', addr))
			else:
				command = command.replace("{" + node_name + "}", addr)
		return command

	def get_edges(self, node1, node2):
		res = []

		for e in self.edges:
			if e.node1 == node1 and e.node2 == node2 or not e.directed and e.node1 == node2 and e.node2 == node1:
				res.append(e)

		return res

	def get_minimal_edge_cost(self, edges):
		cost = 2**32
		for e in edges:
			if e.cost < cost:
				cost = e.cost
		return cost

	def get_all_minimal_edges(self, node1, node2):
		edges = self.get_edges(node1, node2)
		cost = self.get_minimal_edge_cost(edges)
		res = []

		for e in edges:
			if e.cost == cost:
				res.append(e)

		return res

	def get_minimal_edge(self, node1, node2):
		edges = self.get_all_minimal_edges(node1, node2)

		if len(edges) == 0:
			return None

		return edges[0]

	def get_neighbors(self, node1):
		res = set()

		for e in self.edges:
			if e.node1 == node1:
				res.add(e.node2)
			elif not e.directed and e.node2 == node1:
				res.add(e.node1)

		return res

	def set_default_delay(self, dmin, dmax):
		self.dmin = dmin
		self.dmax = dmax

#	def get_min_neighbors(self, n):
#		res = set()
#
#		mcost = 2**32
#		neighs = self.get_neighbors(n)
#
#		for neigh in neighs:
#			e = self.get_minimal_edge(n, neigh)
#			if e.cost < mcost:
#				mcost = e.cost
#
#		for neigh in neighs:
#			e = self.get_minimal_edge(n, neigh)
#			if e.cost == mcost:
#				

	def get_paths(self, Q, S, prev, u):
		w = prev[u]

		if w is None:
			Q.append(S)
			return

		S.append(u)

		for p in w:
			self.get_paths(Q, S[:], prev, p)

	def dijkstra(self, src):
		dist = {}
		prev = {}
		path = {}
		Q = set()

		dist[src] = 0
		prev[src] = None

		for v in self.nodes:
			if v != src:
				dist[v] = 2**32
				prev[v] = []
				path[v] = []
			Q.add(v)

		while len(Q) > 0:
			u = None
			tmpcost = 2**32
			for v in Q:
				if dist[v] < tmpcost:
					tmpcost = dist[v]
					u = v

			S = []
			path[u] = []

			self.get_paths(S, [], prev, u)
			for p in S:
				path[u].append(list(reversed(p)))

			Q.remove(u)

			neighs = self.get_neighbors(u)
			for v in neighs:
				if v not in Q:
					continue
				alt = dist[u] + self.get_minimal_edge(u, v).cost
				if alt < dist[v]:
					dist[v] = alt
					prev[v] = [u]
				elif alt == dist[v]:
					prev[v].append(u)

		return dist, path

	def get_port(self, n, e):
		if e.node1 == n:
			return e.port1
		if e.node2 == n:
			return e.port2
		return None

	def get_nh_from_paths(self, paths):
		nh = []
		for p in paths:
			if len(p) == 0:
				continue
			if p[0] not in nh:
				nh.append(p[0])
		return nh

	def compute_node(self, n):
		n.routes = {}
		dist, path = self.dijkstra(n)
		for t in dist.keys():
			if len(path[t]) == 0:
				continue
			nh = self.get_nh_from_paths(path[t])
			for p in nh:
				e = self.get_minimal_edge(n, p)
				tmp = self.get_port(p, e)
				r = Route(t.addr, p.get_portaddr(tmp), dist[t])
				n.add_route(r)

	def compute(self):
		cnt = 0
		for n in self.nodes:
			print ('# Running dijkstra for node %s (%d/%d)' % (n.name, cnt+1, len(self.nodes)))
			self.compute_node(n)
			cnt += 1
