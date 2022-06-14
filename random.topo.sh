# 4 loop: fc00:2:0:1::1/64
# 1 loop: fc00:2:0:2::1/64
# 10 loop: fc00:2:0:3::1/64
# 9 loop: fc00:2:0:4::1/64
# 2 loop: fc00:2:0:5::1/64
# 6 loop: fc00:2:0:6::1/64
# 8 loop: fc00:2:0:7::1/64
# 0 loop: fc00:2:0:8::1/64
# 3 loop: fc00:2:0:9::1/64
# 7 loop: fc00:2:0:a::1/64
# 5 loop: fc00:2:0:b::1/64

PYTHON_CURR_DIR=`dirname $0`
if [ "$1" == "--query" ]; then shift; if [ "$1" == "4" ]; then echo fc00:2:0:1::1 ; fi ; if [ "$1" == "ifname (4,10) at 4" ]; then echo 4-2 ; fi ; if [ "$1" == "ifname (4,10) at 10" ]; then echo 10-1 ; fi ; if [ "$1" == "edge (4,10) at 4" ]; then echo fc00:42:0:1a::2 ; fi ; if [ "$1" == "edge (4,10) at 10" ]; then echo fc00:42:0:1a::1 ; fi ; if [ "$1" == "ifname (4,0) at 4" ]; then echo 4-0 ; fi ; if [ "$1" == "ifname (4,0) at 0" ]; then echo 0-1 ; fi ; if [ "$1" == "edge (4,0) at 4" ]; then echo fc00:42:0:8::1 ; fi ; if [ "$1" == "edge (4,0) at 0" ]; then echo fc00:42:0:8::2 ; fi ; if [ "$1" == "ifname (4,3) at 4" ]; then echo 4-1 ; fi ; if [ "$1" == "ifname (4,3) at 3" ]; then echo 3-2 ; fi ; if [ "$1" == "edge (4,3) at 4" ]; then echo fc00:42:0:16::1 ; fi ; if [ "$1" == "edge (4,3) at 3" ]; then echo fc00:42:0:16::2 ; fi ; if [ "$1" == "1" ]; then echo fc00:2:0:2::1 ; fi ; if [ "$1" == "ifname (1,9) at 1" ]; then echo 1-0 ; fi ; if [ "$1" == "ifname (1,9) at 9" ]; then echo 9-0 ; fi ; if [ "$1" == "edge (1,9) at 1" ]; then echo fc00:42:0:a::2 ; fi ; if [ "$1" == "edge (1,9) at 9" ]; then echo fc00:42:0:a::1 ; fi ; if [ "$1" == "ifname (1,5) at 1" ]; then echo 1-1 ; fi ; if [ "$1" == "ifname (1,5) at 5" ]; then echo 5-0 ; fi ; if [ "$1" == "edge (1,5) at 1" ]; then echo fc00:42:0:c::2 ; fi ; if [ "$1" == "edge (1,5) at 5" ]; then echo fc00:42:0:c::1 ; fi ; if [ "$1" == "10" ]; then echo fc00:2:0:3::1 ; fi ; if [ "$1" == "ifname (10,4) at 10" ]; then echo 10-1 ; fi ; if [ "$1" == "ifname (10,4) at 4" ]; then echo 4-2 ; fi ; if [ "$1" == "edge (10,4) at 10" ]; then echo fc00:42:0:1a::1 ; fi ; if [ "$1" == "edge (10,4) at 4" ]; then echo fc00:42:0:1a::2 ; fi ; if [ "$1" == "ifname (10,9) at 10" ]; then echo 10-3 ; fi ; if [ "$1" == "ifname (10,9) at 9" ]; then echo 9-4 ; fi ; if [ "$1" == "edge (10,9) at 10" ]; then echo fc00:42:0:24::1 ; fi ; if [ "$1" == "edge (10,9) at 9" ]; then echo fc00:42:0:24::2 ; fi ; if [ "$1" == "ifname (10,3) at 10" ]; then echo 10-0 ; fi ; if [ "$1" == "ifname (10,3) at 3" ]; then echo 3-3 ; fi ; if [ "$1" == "edge (10,3) at 10" ]; then echo fc00:42:0:18::1 ; fi ; if [ "$1" == "edge (10,3) at 3" ]; then echo fc00:42:0:18::2 ; fi ; if [ "$1" == "ifname (10,5) at 10" ]; then echo 10-2 ; fi ; if [ "$1" == "ifname (10,5) at 5" ]; then echo 5-1 ; fi ; if [ "$1" == "edge (10,5) at 10" ]; then echo fc00:42:0:1c::1 ; fi ; if [ "$1" == "edge (10,5) at 5" ]; then echo fc00:42:0:1c::2 ; fi ; if [ "$1" == "9" ]; then echo fc00:2:0:4::1 ; fi ; if [ "$1" == "ifname (9,1) at 9" ]; then echo 9-0 ; fi ; if [ "$1" == "ifname (9,1) at 1" ]; then echo 1-0 ; fi ; if [ "$1" == "edge (9,1) at 9" ]; then echo fc00:42:0:a::1 ; fi ; if [ "$1" == "edge (9,1) at 1" ]; then echo fc00:42:0:a::2 ; fi ; if [ "$1" == "ifname (9,10) at 9" ]; then echo 9-4 ; fi ; if [ "$1" == "ifname (9,10) at 10" ]; then echo 10-3 ; fi ; if [ "$1" == "edge (9,10) at 9" ]; then echo fc00:42:0:24::2 ; fi ; if [ "$1" == "edge (9,10) at 10" ]; then echo fc00:42:0:24::1 ; fi ; if [ "$1" == "ifname (9,6) at 9" ]; then echo 9-1 ; fi ; if [ "$1" == "ifname (9,6) at 6" ]; then echo 6-1 ; fi ; if [ "$1" == "edge (9,6) at 9" ]; then echo fc00:42:0:1e::1 ; fi ; if [ "$1" == "edge (9,6) at 6" ]; then echo fc00:42:0:1e::2 ; fi ; if [ "$1" == "ifname (9,8) at 9" ]; then echo 9-3 ; fi ; if [ "$1" == "ifname (9,8) at 8" ]; then echo 8-2 ; fi ; if [ "$1" == "edge (9,8) at 9" ]; then echo fc00:42:0:22::1 ; fi ; if [ "$1" == "edge (9,8) at 8" ]; then echo fc00:42:0:22::2 ; fi ; if [ "$1" == "ifname (9,7) at 9" ]; then echo 9-2 ; fi ; if [ "$1" == "ifname (9,7) at 7" ]; then echo 7-1 ; fi ; if [ "$1" == "edge (9,7) at 9" ]; then echo fc00:42:0:20::1 ; fi ; if [ "$1" == "edge (9,7) at 7" ]; then echo fc00:42:0:20::2 ; fi ; if [ "$1" == "2" ]; then echo fc00:2:0:5::1 ; fi ; if [ "$1" == "ifname (2,8) at 2" ]; then echo 2-3 ; fi ; if [ "$1" == "ifname (2,8) at 8" ]; then echo 8-1 ; fi ; if [ "$1" == "edge (2,8) at 2" ]; then echo fc00:42:0:12::2 ; fi ; if [ "$1" == "edge (2,8) at 8" ]; then echo fc00:42:0:12::1 ; fi ; if [ "$1" == "ifname (2,0) at 2" ]; then echo 2-0 ; fi ; if [ "$1" == "ifname (2,0) at 0" ]; then echo 0-0 ; fi ; if [ "$1" == "edge (2,0) at 2" ]; then echo fc00:42:0:2::1 ; fi ; if [ "$1" == "edge (2,0) at 0" ]; then echo fc00:42:0:2::2 ; fi ; if [ "$1" == "ifname (2,3) at 2" ]; then echo 2-1 ; fi ; if [ "$1" == "ifname (2,3) at 3" ]; then echo 3-0 ; fi ; if [ "$1" == "edge (2,3) at 2" ]; then echo fc00:42:0:e::2 ; fi ; if [ "$1" == "edge (2,3) at 3" ]; then echo fc00:42:0:e::1 ; fi ; if [ "$1" == "ifname (2,7) at 2" ]; then echo 2-2 ; fi ; if [ "$1" == "ifname (2,7) at 7" ]; then echo 7-0 ; fi ; if [ "$1" == "edge (2,7) at 2" ]; then echo fc00:42:0:10::2 ; fi ; if [ "$1" == "edge (2,7) at 7" ]; then echo fc00:42:0:10::1 ; fi ; if [ "$1" == "6" ]; then echo fc00:2:0:6::1 ; fi ; if [ "$1" == "ifname (6,9) at 6" ]; then echo 6-1 ; fi ; if [ "$1" == "ifname (6,9) at 9" ]; then echo 9-1 ; fi ; if [ "$1" == "edge (6,9) at 6" ]; then echo fc00:42:0:1e::2 ; fi ; if [ "$1" == "edge (6,9) at 9" ]; then echo fc00:42:0:1e::1 ; fi ; if [ "$1" == "ifname (6,3) at 6" ]; then echo 6-0 ; fi ; if [ "$1" == "ifname (6,3) at 3" ]; then echo 3-1 ; fi ; if [ "$1" == "edge (6,3) at 6" ]; then echo fc00:42:0:14::1 ; fi ; if [ "$1" == "edge (6,3) at 3" ]; then echo fc00:42:0:14::2 ; fi ; if [ "$1" == "8" ]; then echo fc00:2:0:7::1 ; fi ; if [ "$1" == "ifname (8,9) at 8" ]; then echo 8-2 ; fi ; if [ "$1" == "ifname (8,9) at 9" ]; then echo 9-3 ; fi ; if [ "$1" == "edge (8,9) at 8" ]; then echo fc00:42:0:22::2 ; fi ; if [ "$1" == "edge (8,9) at 9" ]; then echo fc00:42:0:22::1 ; fi ; if [ "$1" == "ifname (8,2) at 8" ]; then echo 8-1 ; fi ; if [ "$1" == "ifname (8,2) at 2" ]; then echo 2-3 ; fi ; if [ "$1" == "edge (8,2) at 8" ]; then echo fc00:42:0:12::1 ; fi ; if [ "$1" == "edge (8,2) at 2" ]; then echo fc00:42:0:12::2 ; fi ; if [ "$1" == "ifname (8,0) at 8" ]; then echo 8-0 ; fi ; if [ "$1" == "ifname (8,0) at 0" ]; then echo 0-2 ; fi ; if [ "$1" == "edge (8,0) at 8" ]; then echo fc00:42:0:6::1 ; fi ; if [ "$1" == "edge (8,0) at 0" ]; then echo fc00:42:0:6::2 ; fi ; if [ "$1" == "0" ]; then echo fc00:2:0:8::1 ; fi ; if [ "$1" == "ifname (0,4) at 0" ]; then echo 0-1 ; fi ; if [ "$1" == "ifname (0,4) at 4" ]; then echo 4-0 ; fi ; if [ "$1" == "edge (0,4) at 0" ]; then echo fc00:42:0:8::2 ; fi ; if [ "$1" == "edge (0,4) at 4" ]; then echo fc00:42:0:8::1 ; fi ; if [ "$1" == "ifname (0,2) at 0" ]; then echo 0-0 ; fi ; if [ "$1" == "ifname (0,2) at 2" ]; then echo 2-0 ; fi ; if [ "$1" == "edge (0,2) at 0" ]; then echo fc00:42:0:2::2 ; fi ; if [ "$1" == "edge (0,2) at 2" ]; then echo fc00:42:0:2::1 ; fi ; if [ "$1" == "ifname (0,8) at 0" ]; then echo 0-2 ; fi ; if [ "$1" == "ifname (0,8) at 8" ]; then echo 8-0 ; fi ; if [ "$1" == "edge (0,8) at 0" ]; then echo fc00:42:0:6::2 ; fi ; if [ "$1" == "edge (0,8) at 8" ]; then echo fc00:42:0:6::1 ; fi ; if [ "$1" == "3" ]; then echo fc00:2:0:9::1 ; fi ; if [ "$1" == "ifname (3,4) at 3" ]; then echo 3-2 ; fi ; if [ "$1" == "ifname (3,4) at 4" ]; then echo 4-1 ; fi ; if [ "$1" == "edge (3,4) at 3" ]; then echo fc00:42:0:16::2 ; fi ; if [ "$1" == "edge (3,4) at 4" ]; then echo fc00:42:0:16::1 ; fi ; if [ "$1" == "ifname (3,10) at 3" ]; then echo 3-3 ; fi ; if [ "$1" == "ifname (3,10) at 10" ]; then echo 10-0 ; fi ; if [ "$1" == "edge (3,10) at 3" ]; then echo fc00:42:0:18::2 ; fi ; if [ "$1" == "edge (3,10) at 10" ]; then echo fc00:42:0:18::1 ; fi ; if [ "$1" == "ifname (3,2) at 3" ]; then echo 3-0 ; fi ; if [ "$1" == "ifname (3,2) at 2" ]; then echo 2-1 ; fi ; if [ "$1" == "edge (3,2) at 3" ]; then echo fc00:42:0:e::1 ; fi ; if [ "$1" == "edge (3,2) at 2" ]; then echo fc00:42:0:e::2 ; fi ; if [ "$1" == "ifname (3,6) at 3" ]; then echo 3-1 ; fi ; if [ "$1" == "ifname (3,6) at 6" ]; then echo 6-0 ; fi ; if [ "$1" == "edge (3,6) at 3" ]; then echo fc00:42:0:14::2 ; fi ; if [ "$1" == "edge (3,6) at 6" ]; then echo fc00:42:0:14::1 ; fi ; if [ "$1" == "7" ]; then echo fc00:2:0:a::1 ; fi ; if [ "$1" == "ifname (7,9) at 7" ]; then echo 7-1 ; fi ; if [ "$1" == "ifname (7,9) at 9" ]; then echo 9-2 ; fi ; if [ "$1" == "edge (7,9) at 7" ]; then echo fc00:42:0:20::2 ; fi ; if [ "$1" == "edge (7,9) at 9" ]; then echo fc00:42:0:20::1 ; fi ; if [ "$1" == "ifname (7,2) at 7" ]; then echo 7-0 ; fi ; if [ "$1" == "ifname (7,2) at 2" ]; then echo 2-2 ; fi ; if [ "$1" == "edge (7,2) at 7" ]; then echo fc00:42:0:10::1 ; fi ; if [ "$1" == "edge (7,2) at 2" ]; then echo fc00:42:0:10::2 ; fi ; if [ "$1" == "5" ]; then echo fc00:2:0:b::1 ; fi ; if [ "$1" == "ifname (5,1) at 5" ]; then echo 5-0 ; fi ; if [ "$1" == "ifname (5,1) at 1" ]; then echo 1-1 ; fi ; if [ "$1" == "edge (5,1) at 5" ]; then echo fc00:42:0:c::1 ; fi ; if [ "$1" == "edge (5,1) at 1" ]; then echo fc00:42:0:c::2 ; fi ; if [ "$1" == "ifname (5,10) at 5" ]; then echo 5-1 ; fi ; if [ "$1" == "ifname (5,10) at 10" ]; then echo 10-2 ; fi ; if [ "$1" == "edge (5,10) at 5" ]; then echo fc00:42:0:1c::2 ; fi ; if [ "$1" == "edge (5,10) at 10" ]; then echo fc00:42:0:1c::1 ; fi ; exit; fi
if [ "$1" == "--stop" ]; then ip netns exec 4 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 4.throughput.json -o 4.throughput.json" ; ip netns exec 1 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 1.throughput.json -o 1.throughput.json" ; ip netns exec 10 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 10.throughput.json -o 10.throughput.json" ; ip netns exec 9 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 9.throughput.json -o 9.throughput.json" ; ip netns exec 2 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 2.throughput.json -o 2.throughput.json" ; ip netns exec 6 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 6.throughput.json -o 6.throughput.json" ; ip netns exec 8 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 8.throughput.json -o 8.throughput.json" ; ip netns exec 0 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 0.throughput.json -o 0.throughput.json" ; ip netns exec 3 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 3.throughput.json -o 3.throughput.json" ; ip netns exec 7 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 7.throughput.json -o 7.throughput.json" ; ip netns exec 5 bash -c "${PYTHON_CURR_DIR}/throughput.py -e -i 5.throughput.json -o 5.throughput.json" ; ip netns pids 4 | xargs kill -n 9 ; ip netns del 4 ; ip netns pids 1 | xargs kill -n 9 ; ip netns del 1 ; ip netns pids 10 | xargs kill -n 9 ; ip netns del 10 ; ip netns pids 9 | xargs kill -n 9 ; ip netns del 9 ; ip netns pids 2 | xargs kill -n 9 ; ip netns del 2 ; ip netns pids 6 | xargs kill -n 9 ; ip netns del 6 ; ip netns pids 8 | xargs kill -n 9 ; ip netns del 8 ; ip netns pids 0 | xargs kill -n 9 ; ip netns del 0 ; ip netns pids 3 | xargs kill -n 9 ; ip netns del 3 ; ip netns pids 7 | xargs kill -n 9 ; ip netns del 7 ; ip netns pids 5 | xargs kill -n 9 ; ip netns del 5 ;  exit ;  fi 
if [ "$1" == "--link" ]; then shift; if false; then :;  elif [ "$1" == "edge (4,10)" ]; then  ip netns exec 4 bash -c "ifconfig 4-2 $2 " ;  ip netns exec 10 bash -c "ifconfig 10-1 $2 " ;  elif [ "$1" == "edge (4,0)" ]; then  ip netns exec 4 bash -c "ifconfig 4-0 $2 " ;  ip netns exec 0 bash -c "ifconfig 0-1 $2 " ;  elif [ "$1" == "edge (4,3)" ]; then  ip netns exec 4 bash -c "ifconfig 4-1 $2 " ;  ip netns exec 3 bash -c "ifconfig 3-2 $2 " ;  elif [ "$1" == "edge (1,9)" ]; then  ip netns exec 1 bash -c "ifconfig 1-0 $2 " ;  ip netns exec 9 bash -c "ifconfig 9-0 $2 " ;  elif [ "$1" == "edge (1,5)" ]; then  ip netns exec 1 bash -c "ifconfig 1-1 $2 " ;  ip netns exec 5 bash -c "ifconfig 5-0 $2 " ;  elif [ "$1" == "edge (10,4)" ]; then  ip netns exec 10 bash -c "ifconfig 10-1 $2 " ;  ip netns exec 4 bash -c "ifconfig 4-2 $2 " ;  elif [ "$1" == "edge (10,9)" ]; then  ip netns exec 10 bash -c "ifconfig 10-3 $2 " ;  ip netns exec 9 bash -c "ifconfig 9-4 $2 " ;  elif [ "$1" == "edge (10,3)" ]; then  ip netns exec 10 bash -c "ifconfig 10-0 $2 " ;  ip netns exec 3 bash -c "ifconfig 3-3 $2 " ;  elif [ "$1" == "edge (10,5)" ]; then  ip netns exec 10 bash -c "ifconfig 10-2 $2 " ;  ip netns exec 5 bash -c "ifconfig 5-1 $2 " ;  elif [ "$1" == "edge (9,1)" ]; then  ip netns exec 9 bash -c "ifconfig 9-0 $2 " ;  ip netns exec 1 bash -c "ifconfig 1-0 $2 " ;  elif [ "$1" == "edge (9,10)" ]; then  ip netns exec 9 bash -c "ifconfig 9-4 $2 " ;  ip netns exec 10 bash -c "ifconfig 10-3 $2 " ;  elif [ "$1" == "edge (9,6)" ]; then  ip netns exec 9 bash -c "ifconfig 9-1 $2 " ;  ip netns exec 6 bash -c "ifconfig 6-1 $2 " ;  elif [ "$1" == "edge (9,8)" ]; then  ip netns exec 9 bash -c "ifconfig 9-3 $2 " ;  ip netns exec 8 bash -c "ifconfig 8-2 $2 " ;  elif [ "$1" == "edge (9,7)" ]; then  ip netns exec 9 bash -c "ifconfig 9-2 $2 " ;  ip netns exec 7 bash -c "ifconfig 7-1 $2 " ;  elif [ "$1" == "edge (2,8)" ]; then  ip netns exec 2 bash -c "ifconfig 2-3 $2 " ;  ip netns exec 8 bash -c "ifconfig 8-1 $2 " ;  elif [ "$1" == "edge (2,0)" ]; then  ip netns exec 2 bash -c "ifconfig 2-0 $2 " ;  ip netns exec 0 bash -c "ifconfig 0-0 $2 " ;  elif [ "$1" == "edge (2,3)" ]; then  ip netns exec 2 bash -c "ifconfig 2-1 $2 " ;  ip netns exec 3 bash -c "ifconfig 3-0 $2 " ;  elif [ "$1" == "edge (2,7)" ]; then  ip netns exec 2 bash -c "ifconfig 2-2 $2 " ;  ip netns exec 7 bash -c "ifconfig 7-0 $2 " ;  elif [ "$1" == "edge (6,9)" ]; then  ip netns exec 6 bash -c "ifconfig 6-1 $2 " ;  ip netns exec 9 bash -c "ifconfig 9-1 $2 " ;  elif [ "$1" == "edge (6,3)" ]; then  ip netns exec 6 bash -c "ifconfig 6-0 $2 " ;  ip netns exec 3 bash -c "ifconfig 3-1 $2 " ;  elif [ "$1" == "edge (8,9)" ]; then  ip netns exec 8 bash -c "ifconfig 8-2 $2 " ;  ip netns exec 9 bash -c "ifconfig 9-3 $2 " ;  elif [ "$1" == "edge (8,2)" ]; then  ip netns exec 8 bash -c "ifconfig 8-1 $2 " ;  ip netns exec 2 bash -c "ifconfig 2-3 $2 " ;  elif [ "$1" == "edge (8,0)" ]; then  ip netns exec 8 bash -c "ifconfig 8-0 $2 " ;  ip netns exec 0 bash -c "ifconfig 0-2 $2 " ;  elif [ "$1" == "edge (0,4)" ]; then  ip netns exec 0 bash -c "ifconfig 0-1 $2 " ;  ip netns exec 4 bash -c "ifconfig 4-0 $2 " ;  elif [ "$1" == "edge (0,2)" ]; then  ip netns exec 0 bash -c "ifconfig 0-0 $2 " ;  ip netns exec 2 bash -c "ifconfig 2-0 $2 " ;  elif [ "$1" == "edge (0,8)" ]; then  ip netns exec 0 bash -c "ifconfig 0-2 $2 " ;  ip netns exec 8 bash -c "ifconfig 8-0 $2 " ;  elif [ "$1" == "edge (3,4)" ]; then  ip netns exec 3 bash -c "ifconfig 3-2 $2 " ;  ip netns exec 4 bash -c "ifconfig 4-1 $2 " ;  elif [ "$1" == "edge (3,10)" ]; then  ip netns exec 3 bash -c "ifconfig 3-3 $2 " ;  ip netns exec 10 bash -c "ifconfig 10-0 $2 " ;  elif [ "$1" == "edge (3,2)" ]; then  ip netns exec 3 bash -c "ifconfig 3-0 $2 " ;  ip netns exec 2 bash -c "ifconfig 2-1 $2 " ;  elif [ "$1" == "edge (3,6)" ]; then  ip netns exec 3 bash -c "ifconfig 3-1 $2 " ;  ip netns exec 6 bash -c "ifconfig 6-0 $2 " ;  elif [ "$1" == "edge (7,9)" ]; then  ip netns exec 7 bash -c "ifconfig 7-1 $2 " ;  ip netns exec 9 bash -c "ifconfig 9-2 $2 " ;  elif [ "$1" == "edge (7,2)" ]; then  ip netns exec 7 bash -c "ifconfig 7-0 $2 " ;  ip netns exec 2 bash -c "ifconfig 2-2 $2 " ;  elif [ "$1" == "edge (5,1)" ]; then  ip netns exec 5 bash -c "ifconfig 5-0 $2 " ;  ip netns exec 1 bash -c "ifconfig 1-1 $2 " ;  elif [ "$1" == "edge (5,10)" ]; then  ip netns exec 5 bash -c "ifconfig 5-1 $2 " ;  ip netns exec 10 bash -c "ifconfig 10-2 $2 " ;  fi;  exit;  fi 
set -x 


ip netns add 4
ip netns add 1
ip netns add 10
ip netns add 9
ip netns add 2
ip netns add 6
ip netns add 8
ip netns add 0
ip netns add 3
ip netns add 7
ip netns add 5
ip link add name 0-0 type veth peer name 2-0
ip link set 0-0 netns 0
ip link set 2-0 netns 2
ip link add name 0-1 type veth peer name 4-0
ip link set 0-1 netns 0
ip link set 4-0 netns 4
ip link add name 0-2 type veth peer name 8-0
ip link set 0-2 netns 0
ip link set 8-0 netns 8
ip link add name 1-0 type veth peer name 9-0
ip link set 1-0 netns 1
ip link set 9-0 netns 9
ip link add name 1-1 type veth peer name 5-0
ip link set 1-1 netns 1
ip link set 5-0 netns 5
ip link add name 2-1 type veth peer name 3-0
ip link set 2-1 netns 2
ip link set 3-0 netns 3
ip link add name 2-2 type veth peer name 7-0
ip link set 2-2 netns 2
ip link set 7-0 netns 7
ip link add name 2-3 type veth peer name 8-1
ip link set 2-3 netns 2
ip link set 8-1 netns 8
ip link add name 3-1 type veth peer name 6-0
ip link set 3-1 netns 3
ip link set 6-0 netns 6
ip link add name 3-2 type veth peer name 4-1
ip link set 3-2 netns 3
ip link set 4-1 netns 4
ip link add name 3-3 type veth peer name 10-0
ip link set 3-3 netns 3
ip link set 10-0 netns 10
ip link add name 4-2 type veth peer name 10-1
ip link set 4-2 netns 4
ip link set 10-1 netns 10
ip link add name 5-1 type veth peer name 10-2
ip link set 5-1 netns 5
ip link set 10-2 netns 10
ip link add name 6-1 type veth peer name 9-1
ip link set 6-1 netns 6
ip link set 9-1 netns 9
ip link add name 7-1 type veth peer name 9-2
ip link set 7-1 netns 7
ip link set 9-2 netns 9
ip link add name 8-2 type veth peer name 9-3
ip link set 8-2 netns 8
ip link set 9-3 netns 9
ip link add name 9-4 type veth peer name 10-3
ip link set 9-4 netns 9
ip link set 10-3 netns 10

# Commands for namespace 4
ip netns exec 4 bash -c 'ifconfig lo up'
ip netns exec 4 bash -c 'ip -6 ad ad fc00:2:0:1::1/64 dev lo'
ip netns exec 4 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 4 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 4 bash -c '# Edge 4 - 0'
ip netns exec 4 bash -c 'ifconfig 4-0 add fc00:42:0:8::1/64 up'
ip netns exec 4 bash -c 'sysctl net.ipv6.conf.4-0.seg6_enabled=1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-0 root handle 1: htb'
ip netns exec 4 bash -c 'tc class add dev 4-0 parent 1: classid 1:1 htb rate 40000kbit ceil 40000kbit'
ip netns exec 4 bash -c 'tc filter add dev 4-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 4 bash -c '# Edge 4 - 0'
ip netns exec 4 bash -c 'ifconfig 4-0 add fc00:42:0:8::1/64 up'
ip netns exec 4 bash -c 'sysctl net.ipv6.conf.4-0.seg6_enabled=1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-0 root handle 1: htb'
ip netns exec 4 bash -c 'tc class add dev 4-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 4 bash -c 'tc filter add dev 4-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 4 bash -c '# Edge 4 - 3'
ip netns exec 4 bash -c 'ifconfig 4-1 add fc00:42:0:16::1/64 up'
ip netns exec 4 bash -c 'sysctl net.ipv6.conf.4-1.seg6_enabled=1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-1 root handle 1: htb'
ip netns exec 4 bash -c 'tc class add dev 4-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 4 bash -c 'tc filter add dev 4-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 4 bash -c '# Edge 4 - 10'
ip netns exec 4 bash -c 'ifconfig 4-2 add fc00:42:0:1a::2/64 up'
ip netns exec 4 bash -c 'sysctl net.ipv6.conf.4-2.seg6_enabled=1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-2 root handle 1: htb'
ip netns exec 4 bash -c 'tc class add dev 4-2 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 4 bash -c 'tc filter add dev 4-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 4 bash -c 'tc qdisc add dev 4-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:8::2 metric 10000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:1a::1 metric 4000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:8::2 metric 6000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:8::2 metric 2000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:16::2 metric 8000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:8::2 metric 2000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:8::2 metric 1000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:16::2 metric 4000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:8::2 metric 6000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:1a::1 metric 8000 src fc00:2:0:1::1'
ip netns exec 4 bash -c 'ip -6 route add fc00:2:0:7::1 metric 1 table 1 src fc00:2:0:1::1   nexthop via fc00:42:0:8::2  encap seg6 mode inline segs fc00:2:0:5::1  weight 100 '
ip netns exec 4 bash -c 'ip -6 rule add to fc00:2:0:7::1/64 iif lo table 1'
ip netns exec 4 bash -c 'echo bash -c \"START=\\\$SECONDS\; while \! ip netns exec 4 nuttcp -T150 -i1 -R10000 -N16 fc00:2:0:7::1 \>\>flow_4-8.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\$SECONDS \>\>flow_4-8.txt\; done\" | at now+2min'
ip netns exec 4 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 4.throughput.json -s"
ip netns exec 4 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 1
ip netns exec 1 bash -c 'ifconfig lo up'
ip netns exec 1 bash -c 'ip -6 ad ad fc00:2:0:2::1/64 dev lo'
ip netns exec 1 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 1 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 1 bash -c '# Edge 1 - 9'
ip netns exec 1 bash -c 'ifconfig 1-0 add fc00:42:0:a::2/64 up'
ip netns exec 1 bash -c 'sysctl net.ipv6.conf.1-0.seg6_enabled=1'
ip netns exec 1 bash -c 'tc qdisc add dev 1-0 root handle 1: htb'
ip netns exec 1 bash -c 'tc class add dev 1-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 1 bash -c 'tc filter add dev 1-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 1 bash -c 'tc qdisc add dev 1-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 1 bash -c '# Edge 1 - 5'
ip netns exec 1 bash -c 'ifconfig 1-1 add fc00:42:0:c::2/64 up'
ip netns exec 1 bash -c 'sysctl net.ipv6.conf.1-1.seg6_enabled=1'
ip netns exec 1 bash -c 'tc qdisc add dev 1-1 root handle 1: htb'
ip netns exec 1 bash -c 'tc class add dev 1-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 1 bash -c 'tc filter add dev 1-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 1 bash -c 'tc qdisc add dev 1-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:a::1 metric 10000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 metric 8000 src fc00:2:0:2::1 nexthop via fc00:42:0:a::1 weight 1 nexthop via fc00:42:0:c::1 weight 1 '
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:a::1 metric 4000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:a::1 metric 10000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:a::1 metric 8000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:a::1 metric 8000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:a::1 metric 9000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 metric 12000 src fc00:2:0:2::1 nexthop via fc00:42:0:a::1 weight 1 nexthop via fc00:42:0:c::1 weight 1 '
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:a::1 metric 8000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:c::1 metric 4000 src fc00:2:0:2::1'
ip netns exec 1 bash -c 'nuttcp -6 -S'
ip netns exec 1 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 1.throughput.json -s"
ip netns exec 1 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 10
ip netns exec 10 bash -c 'ifconfig lo up'
ip netns exec 10 bash -c 'ip -6 ad ad fc00:2:0:3::1/64 dev lo'
ip netns exec 10 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 10 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 10 bash -c '# Edge 10 - 3'
ip netns exec 10 bash -c 'ifconfig 10-0 add fc00:42:0:18::1/64 up'
ip netns exec 10 bash -c 'sysctl net.ipv6.conf.10-0.seg6_enabled=1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-0 root handle 1: htb'
ip netns exec 10 bash -c 'tc class add dev 10-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 10 bash -c 'tc filter add dev 10-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 10 bash -c '# Edge 10 - 4'
ip netns exec 10 bash -c 'ifconfig 10-1 add fc00:42:0:1a::1/64 up'
ip netns exec 10 bash -c 'sysctl net.ipv6.conf.10-1.seg6_enabled=1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-1 root handle 1: htb'
ip netns exec 10 bash -c 'tc class add dev 10-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 10 bash -c 'tc filter add dev 10-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 10 bash -c '# Edge 10 - 5'
ip netns exec 10 bash -c 'ifconfig 10-2 add fc00:42:0:1c::1/64 up'
ip netns exec 10 bash -c 'sysctl net.ipv6.conf.10-2.seg6_enabled=1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-2 root handle 1: htb'
ip netns exec 10 bash -c 'tc class add dev 10-2 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 10 bash -c 'tc filter add dev 10-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 10 bash -c '# Edge 10 - 9'
ip netns exec 10 bash -c 'ifconfig 10-3 add fc00:42:0:24::1/64 up'
ip netns exec 10 bash -c 'sysctl net.ipv6.conf.10-3.seg6_enabled=1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-3 root handle 1: htb'
ip netns exec 10 bash -c 'tc class add dev 10-3 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 10 bash -c 'tc filter add dev 10-3 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 10 bash -c 'tc qdisc add dev 10-3 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:1a::2 metric 4000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 metric 8000 src fc00:2:0:3::1 nexthop via fc00:42:0:24::2 weight 1 nexthop via fc00:42:0:1c::2 weight 1 '
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:24::2 metric 4000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:1a::2 metric 6000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 metric 8000 src fc00:2:0:3::1 nexthop via fc00:42:0:18::2 weight 1 nexthop via fc00:42:0:24::2 weight 1 '
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:1a::2 metric 6000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:1a::2 metric 5000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:18::2 metric 4000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:24::2 metric 8000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:1c::2 metric 4000 src fc00:2:0:3::1'
ip netns exec 10 bash -c 'nuttcp -6 -S'
ip netns exec 10 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 10.throughput.json -s"
ip netns exec 10 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 9
ip netns exec 9 bash -c 'ifconfig lo up'
ip netns exec 9 bash -c 'ip -6 ad ad fc00:2:0:4::1/64 dev lo'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 9 bash -c '# Edge 9 - 1'
ip netns exec 9 bash -c 'ifconfig 9-0 add fc00:42:0:a::1/64 up'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.9-0.seg6_enabled=1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-0 root handle 1: htb'
ip netns exec 9 bash -c 'tc class add dev 9-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 9 bash -c 'tc filter add dev 9-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 9 bash -c '# Edge 9 - 6'
ip netns exec 9 bash -c 'ifconfig 9-1 add fc00:42:0:1e::1/64 up'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.9-1.seg6_enabled=1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-1 root handle 1: htb'
ip netns exec 9 bash -c 'tc class add dev 9-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 9 bash -c 'tc filter add dev 9-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 9 bash -c '# Edge 9 - 7'
ip netns exec 9 bash -c 'ifconfig 9-2 add fc00:42:0:20::1/64 up'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.9-2.seg6_enabled=1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-2 root handle 1: htb'
ip netns exec 9 bash -c 'tc class add dev 9-2 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 9 bash -c 'tc filter add dev 9-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 9 bash -c '# Edge 9 - 8'
ip netns exec 9 bash -c 'ifconfig 9-3 add fc00:42:0:22::1/64 up'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.9-3.seg6_enabled=1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-3 root handle 1: htb'
ip netns exec 9 bash -c 'tc class add dev 9-3 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 9 bash -c 'tc filter add dev 9-3 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-3 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 9 bash -c '# Edge 9 - 10'
ip netns exec 9 bash -c 'ifconfig 9-4 add fc00:42:0:24::2/64 up'
ip netns exec 9 bash -c 'sysctl net.ipv6.conf.9-4.seg6_enabled=1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-4 root handle 1: htb'
ip netns exec 9 bash -c 'tc class add dev 9-4 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 9 bash -c 'tc filter add dev 9-4 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 9 bash -c 'tc qdisc add dev 9-4 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:22::2 metric 6000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:a::2 metric 4000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:24::1 metric 4000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:22::2 metric 6000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:1e::2 metric 4000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:22::2 metric 4000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:22::2 metric 5000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 metric 8000 src fc00:2:0:4::1 nexthop via fc00:42:0:24::1 weight 1 nexthop via fc00:42:0:1e::2 weight 1 '
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:20::2 metric 4000 src fc00:2:0:4::1'
ip netns exec 9 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 metric 8000 src fc00:2:0:4::1 nexthop via fc00:42:0:24::1 weight 1 nexthop via fc00:42:0:a::2 weight 1 '
ip netns exec 9 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 9.throughput.json -s"
ip netns exec 9 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 2
ip netns exec 2 bash -c 'ifconfig lo up'
ip netns exec 2 bash -c 'ip -6 ad ad fc00:2:0:5::1/64 dev lo'
ip netns exec 2 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 2 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 2 bash -c '# Edge 2 - 0'
ip netns exec 2 bash -c 'ifconfig 2-0 add fc00:42:0:2::1/64 up'
ip netns exec 2 bash -c 'sysctl net.ipv6.conf.2-0.seg6_enabled=1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-0 root handle 1: htb'
ip netns exec 2 bash -c 'tc class add dev 2-0 parent 1: classid 1:1 htb rate 40000kbit ceil 40000kbit'
ip netns exec 2 bash -c 'tc filter add dev 2-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 2 bash -c '# Edge 2 - 3'
ip netns exec 2 bash -c 'ifconfig 2-1 add fc00:42:0:e::2/64 up'
ip netns exec 2 bash -c 'sysctl net.ipv6.conf.2-1.seg6_enabled=1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-1 root handle 1: htb'
ip netns exec 2 bash -c 'tc class add dev 2-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 2 bash -c 'tc filter add dev 2-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 2 bash -c '# Edge 2 - 7'
ip netns exec 2 bash -c 'ifconfig 2-2 add fc00:42:0:10::2/64 up'
ip netns exec 2 bash -c 'sysctl net.ipv6.conf.2-2.seg6_enabled=1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-2 root handle 1: htb'
ip netns exec 2 bash -c 'tc class add dev 2-2 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 2 bash -c 'tc filter add dev 2-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 2 bash -c '# Edge 2 - 8'
ip netns exec 2 bash -c 'ifconfig 2-3 add fc00:42:0:12::2/64 up'
ip netns exec 2 bash -c 'sysctl net.ipv6.conf.2-3.seg6_enabled=1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-3 root handle 1: htb'
ip netns exec 2 bash -c 'tc class add dev 2-3 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 2 bash -c 'tc filter add dev 2-3 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 2 bash -c 'tc qdisc add dev 2-3 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:2::2 metric 2000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:2::2 metric 10000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:2::2 metric 6000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:2::2 metric 6000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:e::1 metric 8000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:2::2 metric 2000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:2::2 metric 1000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:e::1 metric 4000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:10::1 metric 4000 src fc00:2:0:5::1'
ip netns exec 2 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:2::2 metric 10000 src fc00:2:0:5::1'
ip netns exec 2 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 2.throughput.json -s"
ip netns exec 2 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 6
ip netns exec 6 bash -c 'ifconfig lo up'
ip netns exec 6 bash -c 'ip -6 ad ad fc00:2:0:6::1/64 dev lo'
ip netns exec 6 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 6 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 6 bash -c '# Edge 6 - 3'
ip netns exec 6 bash -c 'ifconfig 6-0 add fc00:42:0:14::1/64 up'
ip netns exec 6 bash -c 'sysctl net.ipv6.conf.6-0.seg6_enabled=1'
ip netns exec 6 bash -c 'tc qdisc add dev 6-0 root handle 1: htb'
ip netns exec 6 bash -c 'tc class add dev 6-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 6 bash -c 'tc filter add dev 6-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 6 bash -c 'tc qdisc add dev 6-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 6 bash -c '# Edge 6 - 9'
ip netns exec 6 bash -c 'ifconfig 6-1 add fc00:42:0:1e::2/64 up'
ip netns exec 6 bash -c 'sysctl net.ipv6.conf.6-1.seg6_enabled=1'
ip netns exec 6 bash -c 'tc qdisc add dev 6-1 root handle 1: htb'
ip netns exec 6 bash -c 'tc class add dev 6-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 6 bash -c 'tc filter add dev 6-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 6 bash -c 'tc qdisc add dev 6-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:14::2 metric 8000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:1e::1 metric 8000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 metric 8000 src fc00:2:0:6::1 nexthop via fc00:42:0:14::2 weight 1 nexthop via fc00:42:0:1e::1 weight 1 '
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:1e::1 metric 4000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:14::2 metric 8000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:1e::1 metric 8000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 metric 9000 src fc00:2:0:6::1 nexthop via fc00:42:0:14::2 weight 1 nexthop via fc00:42:0:1e::1 weight 1 '
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:14::2 metric 4000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:1e::1 metric 8000 src fc00:2:0:6::1'
ip netns exec 6 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 metric 12000 src fc00:2:0:6::1 nexthop via fc00:42:0:14::2 weight 1 nexthop via fc00:42:0:1e::1 weight 1 '
ip netns exec 6 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 6.throughput.json -s"
ip netns exec 6 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 8
ip netns exec 8 bash -c 'ifconfig lo up'
ip netns exec 8 bash -c 'ip -6 ad ad fc00:2:0:7::1/64 dev lo'
ip netns exec 8 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 8 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 8 bash -c '# Edge 8 - 0'
ip netns exec 8 bash -c 'ifconfig 8-0 add fc00:42:0:6::1/64 up'
ip netns exec 8 bash -c 'sysctl net.ipv6.conf.8-0.seg6_enabled=1'
ip netns exec 8 bash -c 'tc qdisc add dev 8-0 root handle 1: htb'
ip netns exec 8 bash -c 'tc class add dev 8-0 parent 1: classid 1:1 htb rate 40000kbit ceil 40000kbit'
ip netns exec 8 bash -c 'tc filter add dev 8-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 8 bash -c 'tc qdisc add dev 8-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 8 bash -c '# Edge 8 - 2'
ip netns exec 8 bash -c 'ifconfig 8-1 add fc00:42:0:12::1/64 up'
ip netns exec 8 bash -c 'sysctl net.ipv6.conf.8-1.seg6_enabled=1'
ip netns exec 8 bash -c 'tc qdisc add dev 8-1 root handle 1: htb'
ip netns exec 8 bash -c 'tc class add dev 8-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 8 bash -c 'tc filter add dev 8-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 8 bash -c 'tc qdisc add dev 8-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 8 bash -c '# Edge 8 - 9'
ip netns exec 8 bash -c 'ifconfig 8-2 add fc00:42:0:22::2/64 up'
ip netns exec 8 bash -c 'sysctl net.ipv6.conf.8-2.seg6_enabled=1'
ip netns exec 8 bash -c 'tc qdisc add dev 8-2 root handle 1: htb'
ip netns exec 8 bash -c 'tc class add dev 8-2 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 8 bash -c 'tc filter add dev 8-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 8 bash -c 'tc qdisc add dev 8-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:6::2 metric 2000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:22::1 metric 8000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:6::2 metric 6000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:22::1 metric 4000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:6::2 metric 2000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:22::1 metric 8000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:6::2 metric 1000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:6::2 metric 6000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:6::2 metric 6000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:6::2 metric 10000 src fc00:2:0:7::1'
ip netns exec 8 bash -c 'nuttcp -6 -S'
ip netns exec 8 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 8.throughput.json -s"
ip netns exec 8 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 0
ip netns exec 0 bash -c 'ifconfig lo up'
ip netns exec 0 bash -c 'ip -6 ad ad fc00:2:0:8::1/64 dev lo'
ip netns exec 0 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 0 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 0 bash -c '# Edge 0 - 2'
ip netns exec 0 bash -c 'ifconfig 0-0 add fc00:42:0:2::2/64 up'
ip netns exec 0 bash -c 'sysctl net.ipv6.conf.0-0.seg6_enabled=1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-0 root handle 1: htb'
ip netns exec 0 bash -c 'tc class add dev 0-0 parent 1: classid 1:1 htb rate 40000kbit ceil 40000kbit'
ip netns exec 0 bash -c 'tc filter add dev 0-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 0 bash -c '# Edge 0 - 4'
ip netns exec 0 bash -c 'ifconfig 0-1 add fc00:42:0:8::2/64 up'
ip netns exec 0 bash -c 'sysctl net.ipv6.conf.0-1.seg6_enabled=1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-1 root handle 1: htb'
ip netns exec 0 bash -c 'tc class add dev 0-1 parent 1: classid 1:1 htb rate 40000kbit ceil 40000kbit'
ip netns exec 0 bash -c 'tc filter add dev 0-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 0 bash -c '# Edge 0 - 8'
ip netns exec 0 bash -c 'ifconfig 0-2 add fc00:42:0:6::2/64 up'
ip netns exec 0 bash -c 'sysctl net.ipv6.conf.0-2.seg6_enabled=1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-2 root handle 1: htb'
ip netns exec 0 bash -c 'tc class add dev 0-2 parent 1: classid 1:1 htb rate 40000kbit ceil 40000kbit'
ip netns exec 0 bash -c 'tc filter add dev 0-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 0 bash -c '# Edge 0 - 4'
ip netns exec 0 bash -c 'ifconfig 0-1 add fc00:42:0:8::2/64 up'
ip netns exec 0 bash -c 'sysctl net.ipv6.conf.0-1.seg6_enabled=1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-1 root handle 1: htb'
ip netns exec 0 bash -c 'tc class add dev 0-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 0 bash -c 'tc filter add dev 0-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 0 bash -c 'tc qdisc add dev 0-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:8::1 metric 1000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:6::1 metric 9000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:8::1 metric 5000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:6::1 metric 5000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:2::1 metric 1000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 metric 9000 src fc00:2:0:8::1 nexthop via fc00:42:0:2::1 weight 1 nexthop via fc00:42:0:8::1 weight 1 nexthop via fc00:42:0:6::1 weight 1 '
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:6::1 metric 1000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 metric 5000 src fc00:2:0:8::1 nexthop via fc00:42:0:2::1 weight 1 nexthop via fc00:42:0:8::1 weight 1 '
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:2::1 metric 5000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:8::1 metric 9000 src fc00:2:0:8::1'
ip netns exec 0 bash -c 'ip -6 route add fc00:2:0:3::1 metric 1 table 1 src fc00:2:0:8::1   nexthop via fc00:42:0:6::1  encap seg6 mode inline segs fc00:2:0:7::1  weight 100 '
ip netns exec 0 bash -c 'ip -6 rule add to fc00:2:0:3::1/64 iif lo table 1'
ip netns exec 0 bash -c 'echo bash -c \"START=\\\$SECONDS\; while \! ip netns exec 0 nuttcp -T150 -i1 -R10000 -N16 fc00:2:0:3::1 \>\>flow_0-10.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\$SECONDS \>\>flow_0-10.txt\; done\" | at now+2min'
ip netns exec 0 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 0.throughput.json -s"
ip netns exec 0 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 3
ip netns exec 3 bash -c 'ifconfig lo up'
ip netns exec 3 bash -c 'ip -6 ad ad fc00:2:0:9::1/64 dev lo'
ip netns exec 3 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 3 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 3 bash -c '# Edge 3 - 2'
ip netns exec 3 bash -c 'ifconfig 3-0 add fc00:42:0:e::1/64 up'
ip netns exec 3 bash -c 'sysctl net.ipv6.conf.3-0.seg6_enabled=1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-0 root handle 1: htb'
ip netns exec 3 bash -c 'tc class add dev 3-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 3 bash -c 'tc filter add dev 3-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 3 bash -c '# Edge 3 - 6'
ip netns exec 3 bash -c 'ifconfig 3-1 add fc00:42:0:14::2/64 up'
ip netns exec 3 bash -c 'sysctl net.ipv6.conf.3-1.seg6_enabled=1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-1 root handle 1: htb'
ip netns exec 3 bash -c 'tc class add dev 3-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 3 bash -c 'tc filter add dev 3-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 3 bash -c '# Edge 3 - 4'
ip netns exec 3 bash -c 'ifconfig 3-2 add fc00:42:0:16::2/64 up'
ip netns exec 3 bash -c 'sysctl net.ipv6.conf.3-2.seg6_enabled=1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-2 root handle 1: htb'
ip netns exec 3 bash -c 'tc class add dev 3-2 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 3 bash -c 'tc filter add dev 3-2 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-2 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 3 bash -c '# Edge 3 - 10'
ip netns exec 3 bash -c 'ifconfig 3-3 add fc00:42:0:18::2/64 up'
ip netns exec 3 bash -c 'sysctl net.ipv6.conf.3-3.seg6_enabled=1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-3 root handle 1: htb'
ip netns exec 3 bash -c 'tc class add dev 3-3 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 3 bash -c 'tc filter add dev 3-3 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 3 bash -c 'tc qdisc add dev 3-3 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:16::1 metric 4000 src fc00:2:0:9::1'
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 metric 12000 src fc00:2:0:9::1 nexthop via fc00:42:0:18::1 weight 1 nexthop via fc00:42:0:14::1 weight 1 '
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:18::1 metric 4000 src fc00:2:0:9::1'
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 metric 8000 src fc00:2:0:9::1 nexthop via fc00:42:0:18::1 weight 1 nexthop via fc00:42:0:14::1 weight 1 '
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:e::2 metric 4000 src fc00:2:0:9::1'
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:14::1 metric 4000 src fc00:2:0:9::1'
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 metric 6000 src fc00:2:0:9::1 nexthop via fc00:42:0:e::2 weight 1 nexthop via fc00:42:0:16::1 weight 1 '
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 metric 5000 src fc00:2:0:9::1 nexthop via fc00:42:0:e::2 weight 1 nexthop via fc00:42:0:16::1 weight 1 '
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 via fc00:42:0:e::2 metric 8000 src fc00:2:0:9::1'
ip netns exec 3 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:18::1 metric 8000 src fc00:2:0:9::1'
ip netns exec 3 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 3.throughput.json -s"
ip netns exec 3 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 7
ip netns exec 7 bash -c 'ifconfig lo up'
ip netns exec 7 bash -c 'ip -6 ad ad fc00:2:0:a::1/64 dev lo'
ip netns exec 7 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 7 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 7 bash -c '# Edge 7 - 2'
ip netns exec 7 bash -c 'ifconfig 7-0 add fc00:42:0:10::1/64 up'
ip netns exec 7 bash -c 'sysctl net.ipv6.conf.7-0.seg6_enabled=1'
ip netns exec 7 bash -c 'tc qdisc add dev 7-0 root handle 1: htb'
ip netns exec 7 bash -c 'tc class add dev 7-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 7 bash -c 'tc filter add dev 7-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 7 bash -c 'tc qdisc add dev 7-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 7 bash -c '# Edge 7 - 9'
ip netns exec 7 bash -c 'ifconfig 7-1 add fc00:42:0:20::2/64 up'
ip netns exec 7 bash -c 'sysctl net.ipv6.conf.7-1.seg6_enabled=1'
ip netns exec 7 bash -c 'tc qdisc add dev 7-1 root handle 1: htb'
ip netns exec 7 bash -c 'tc class add dev 7-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 7 bash -c 'tc filter add dev 7-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 7 bash -c 'tc qdisc add dev 7-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:10::2 metric 6000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:20::1 metric 8000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:20::1 metric 8000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 via fc00:42:0:20::1 metric 4000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:10::2 metric 4000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 via fc00:42:0:20::1 metric 8000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:10::2 metric 6000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:10::2 metric 5000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:10::2 metric 8000 src fc00:2:0:a::1'
ip netns exec 7 bash -c 'ip -6 ro ad fc00:2:0:b::1/64 via fc00:42:0:20::1 metric 12000 src fc00:2:0:a::1'
ip netns exec 7 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 7.throughput.json -s"
ip netns exec 7 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'

# Commands for namespace 5
ip netns exec 5 bash -c 'ifconfig lo up'
ip netns exec 5 bash -c 'ip -6 ad ad fc00:2:0:b::1/64 dev lo'
ip netns exec 5 bash -c 'sysctl net.ipv6.conf.all.forwarding=1'
ip netns exec 5 bash -c 'sysctl net.ipv6.conf.all.seg6_enabled=1'
ip netns exec 5 bash -c '# Edge 5 - 1'
ip netns exec 5 bash -c 'ifconfig 5-0 add fc00:42:0:c::1/64 up'
ip netns exec 5 bash -c 'sysctl net.ipv6.conf.5-0.seg6_enabled=1'
ip netns exec 5 bash -c 'tc qdisc add dev 5-0 root handle 1: htb'
ip netns exec 5 bash -c 'tc class add dev 5-0 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 5 bash -c 'tc filter add dev 5-0 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 5 bash -c 'tc qdisc add dev 5-0 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 5 bash -c '# Edge 5 - 10'
ip netns exec 5 bash -c 'ifconfig 5-1 add fc00:42:0:1c::2/64 up'
ip netns exec 5 bash -c 'sysctl net.ipv6.conf.5-1.seg6_enabled=1'
ip netns exec 5 bash -c 'tc qdisc add dev 5-1 root handle 1: htb'
ip netns exec 5 bash -c 'tc class add dev 5-1 parent 1: classid 1:1 htb rate 10000kbit ceil 10000kbit'
ip netns exec 5 bash -c 'tc filter add dev 5-1 protocol ipv6 parent 1: prio 1 u32 match ip6 dst ::/0 flowid 1:1'
ip netns exec 5 bash -c 'tc qdisc add dev 5-1 parent 1:1 handle 10: netem delay 0.20ms'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:1::1/64 via fc00:42:0:1c::1 metric 8000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:2::1/64 via fc00:42:0:c::2 metric 4000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:3::1/64 via fc00:42:0:1c::1 metric 4000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:4::1/64 metric 8000 src fc00:2:0:b::1 nexthop via fc00:42:0:1c::1 weight 1 nexthop via fc00:42:0:c::2 weight 1 '
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:5::1/64 via fc00:42:0:1c::1 metric 10000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:6::1/64 metric 12000 src fc00:2:0:b::1 nexthop via fc00:42:0:1c::1 weight 1 nexthop via fc00:42:0:c::2 weight 1 '
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:7::1/64 via fc00:42:0:1c::1 metric 10000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:8::1/64 via fc00:42:0:1c::1 metric 9000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:9::1/64 via fc00:42:0:1c::1 metric 8000 src fc00:2:0:b::1'
ip netns exec 5 bash -c 'ip -6 ro ad fc00:2:0:a::1/64 metric 12000 src fc00:2:0:b::1 nexthop via fc00:42:0:1c::1 weight 1 nexthop via fc00:42:0:c::2 weight 1 '
ip netns exec 5 bash -c 'ip -6 route add fc00:2:0:2::1 metric 1 table 1 src fc00:2:0:b::1   nexthop via fc00:42:0:1c::1  encap seg6 mode inline segs fc00:2:0:6::1  weight 50  nexthop via fc00:42:0:c::2  encap seg6 mode inline segs fc00:2:0:6::1  weight 50 '
ip netns exec 5 bash -c 'ip -6 rule add to fc00:2:0:2::1/64 iif lo table 1'
ip netns exec 5 bash -c 'echo bash -c \"START=\\\$SECONDS\; while \! ip netns exec 5 nuttcp -T150 -i1 -R10000 -N16 fc00:2:0:2::1 \>\>flow_5-1.txt 2\>\&1 \; do sleep 1\; echo RTY\: \\\$SECONDS \>\>flow_5-1.txt\; done\" | at now+2min'
ip netns exec 5 bash -c "${PYTHON_CURR_DIR}/throughput.py -o 5.throughput.json -s"
ip netns exec 5 bash -c 'sysctl net.ipv6.fib_multipath_hash_policy=1'
