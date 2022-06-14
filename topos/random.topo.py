
#!/usr/bin/env python3
from node import *

class random(Topo):
    def build(self):
        self.add_node("0")
        self.add_node("1")
        self.add_node("2")
        self.add_node("3")
        self.add_node("4")
        self.add_node("5")
        self.add_node("6")
        self.add_node("7")
        self.add_node("8")
        self.add_node("9")
        self.add_node("10")
        self.add_link_name("0", "2", cost=1000, delay=0.2, bw=40000, directed=True)
        self.add_link_name("2", "0", cost=1000, delay=0.2, bw=40000, directed=True)
        self.add_link_name("0", "4", cost=1000, delay=0.2, bw=40000, directed=True)
        self.add_link_name("4", "0", cost=1000, delay=0.2, bw=40000, directed=True)
        self.add_link_name("0", "8", cost=1000, delay=0.2, bw=40000, directed=True)
        self.add_link_name("8", "0", cost=1000, delay=0.2, bw=40000, directed=True)
        self.add_link_name("0", "4", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("4", "0", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("1", "9", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("9", "1", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("1", "5", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("5", "1", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("2", "3", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("3", "2", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("2", "7", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("7", "2", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("2", "8", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("8", "2", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("3", "6", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("6", "3", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("3", "4", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("4", "3", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("3", "10", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("10", "3", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("4", "10", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("10", "4", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("5", "10", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("10", "5", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("6", "9", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("9", "6", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("7", "9", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("9", "7", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("8", "9", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("9", "8", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("9", "10", cost=4000, delay=0.2, bw=10000, directed=True)
        self.add_link_name("10", "9", cost=4000, delay=0.2, bw=10000, directed=True)
    
    def dijkstra_computed(self):
        # Demand from 0 to 10
        build_str = ""
        nhlist = self.get_dijkstra_route_by_name("0","8")
        for nh in nhlist:
            build_str += f" nexthop via {nh.nh} "+" encap seg6 mode inline segs {8} "+ f" weight {int(100/len(nhlist))} "
        self.add_command("0", f"ip -6 route add {{10}} metric 1 table 1 src {{0}}  {build_str}")
        # Demand from 4 to 8
        build_str = ""
        nhlist = self.get_dijkstra_route_by_name("4","2")
        for nh in nhlist:
            build_str += f" nexthop via {nh.nh} "+" encap seg6 mode inline segs {2} "+ f" weight {int(100/len(nhlist))} "
        self.add_command("4", f"ip -6 route add {{8}} metric 1 table 1 src {{4}}  {build_str}")
        # Demand from 5 to 1
        build_str = ""
        nhlist = self.get_dijkstra_route_by_name("5","6")
        for nh in nhlist:
            build_str += f" nexthop via {nh.nh} "+" encap seg6 mode inline segs {6} "+ f" weight {int(100/len(nhlist))} "
        self.add_command("5", f"ip -6 route add {{1}} metric 1 table 1 src {{5}}  {build_str}")
        self.add_command("0", "ip -6 rule add to {10/} iif lo table 1")
        self.add_command("4", "ip -6 rule add to {8/} iif lo table 1")
        self.add_command("5", "ip -6 rule add to {1/} iif lo table 1")
        self.add_command("8", "nuttcp -6 -S")
        self.add_command("1", "nuttcp -6 -S")
        self.add_command("10", "nuttcp -6 -S")
        self.add_command("0", 'echo bash -c \\\"START=\\\\\$SECONDS\; while \! ip netns exec 0 nuttcp -T150 -i1 -R10000 -N16 {10} \>\>flow_0-10.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\\\$SECONDS \>\>flow_0-10.txt\; done\\\" | at now+2min')
        self.add_command("4", 'echo bash -c \\\"START=\\\\\$SECONDS\; while \! ip netns exec 4 nuttcp -T150 -i1 -R10000 -N16 {8} \>\>flow_4-8.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\\\$SECONDS \>\>flow_4-8.txt\; done\\\" | at now+2min')
        self.add_command("5", 'echo bash -c \\\"START=\\\\\$SECONDS\; while \! ip netns exec 5 nuttcp -T150 -i1 -R10000 -N16 {1} \>\>flow_5-1.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\\\$SECONDS \>\>flow_5-1.txt\; done\\\" | at now+2min')

        self.enable_throughput()
        self.add_command("0", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("1", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("2", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("3", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("4", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("5", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("6", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("7", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("8", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("9", "sysctl net.ipv6.fib_multipath_hash_policy=1")
        self.add_command("10", "sysctl net.ipv6.fib_multipath_hash_policy=1")

topos = {'random': (lambda: random())}

