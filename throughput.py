#!/usr/bin/env python3

import json
import subprocess
import sys
import time
import getopt
import os

class Throughput(object):

	def __init__(self):
		self.start = None
		self.start_time = None
		self.end = None
		self.end_time = None

	def start_now(self):
		self.start = self.get_statistics()
		self.start_time = time.time()

	def end_now(self):
		self.end = self.get_statistics()
		self.end_time = time.time()

	def get_diff(self):
		return self.statistics_diff(self.start, self.end)

	# Get statistic by interface from /proc/net/dev
	# Based on https://stackoverflow.com/a/1052628
	@staticmethod
	def get_statistics():
		with open("/proc/net/dev", "r") as file:
			lines = file.readlines()
			_, recv, trans = lines[1].split("|")
			recv = list(map(lambda a: "recv_" + a, recv.split()))
			trans = list(map(lambda a: "trans_" + a, trans.split()))
			cols = recv+trans

			interfaces = {}
			for line in lines[2:]:
				interface, data = line.split(":")
				ifdata = dict(zip(cols, list(map(lambda x: int(x), data.split()))))
				interfaces[interface.strip()] = ifdata

		return interfaces

	# Calculate difference between two statistics
	@staticmethod
	def statistics_diff(start, end):
		ret = {}
		for interface1 in start:
			for interface2 in end:
				if interface1 == interface2:
					diff = [ i-j for i,j in zip(end.get(interface1).values(),start.get(interface1).values())]
					ret[interface1] = dict(zip(start.get(interface1).keys(), diff))
		return ret

def usage():
	print(f"Usage: {sys.argv[0]} <OPTIONS>")
	print(
		"""
Options:
   -h, --help
      Prints this help.
   -o <FILE>, --output-file=<FILE>
      output file, default /dev/stdout
   -i <FILE>, --input-file=<FILE>
      input file, default /dev/stdin
   -n <COMMA-SEPARATED LIST>, --namespaces=<COMMA-SEPARATED LIST>
      NOT SUPPORTED YET.
   -s, --start
      start the measuring. This will produce a file specified with "-o <FILE>".
   -e, --end
      end the measuring. This will read the file specified with "-i <FILE>" 
      and write the difference to the output file specified with "-o <FILE>".
   -c <COMMA-SEPARATED LIST>, --csv=<COMMA-SEPARATED LIST>
      A small script to extract columns from the json format and write them 
      into CSV format. INPUT_FILE will be read, and the output will be written
      to OUTPUT_FILE. A comma-separated list of columns to be extracted must 
      be provided.
      This option can be combined with "--interfaces".
   --interfaces=<COMMA-SEPARATED LIST>
      A list of interfaces to be extracted. Has only effect with "--csv" option.
   -a, --all
      For all files in current directory ending with "<NSNAME>.throughput.json",
      call the "--end" accordingly. The name of the namespace is part of the
      filename. (E.g., throguhput.json executes in the default namespace, while
      ns1.throughput.json executes in the namespace ns1.)
		"""
	)

if __name__ == "__main__":
	if len(sys.argv) < 2:
		usage()
		sys.exit(0)
	try:
		opts, args = getopt.getopt(
			sys.argv[1:],
			"ho:i:n:sec:a",
			["help","output-file=","input-file=","namespaces=","start","end","csv","interfaces=","--all"]
		)
	except getopt.GetoptError as exception:
		print(exception)
		usage()
		sys.exit(1)
	namespaces = []
	output_file = '/dev/stdout'
	input_file = '/dev/stdin'
	start = False
	end = False
	csv = False
	csv_fields = []
	interfaces = []
	all = False

	for opt,arg in opts:
		if( opt in ['-h', '--help']):
			usage()
		elif( opt in ['-o','--output-file'] ):
			output_file = arg
		elif (opt in ['-i', '--input-file']):
			input_file = arg
		elif( opt in ['-n','--namespaces'] ):
			namespaces = arg.split(',')
		elif( opt in ['-s','--start'] ):
			start = True
		elif( opt in ['-e','--end'] ):
			end = True
		elif( opt in ['-c','--csv']):
			csv = True
			csv_fields = arg.split(',')
		elif( opt in ['--interfaces'] ):
			interfaces = arg.split(',')
		elif( opt in ['-a', '--all'] ):
			all = True

	if start and end:
		print("Only start or and is supported.")
		usage()
		sys.exit(1)

	if start:
		t = Throughput()
		t.start_now()
		with open(output_file, "w") as output:
			json.dump(t.get_statistics(), output)
		sys.exit(0)

	if end:
		t = Throughput()
		with open(input_file, "r") as input:
			t.start = json.load(input)
		t.end_now()
		with open(output_file, "w") as output:
			json.dump(t.get_diff(), output)
		sys.exit(0)

	if csv:
		with open(input_file, "r") as input:
			data = json.load(input)
		with open(output_file, "w") as output:
			output_string = ""
			for interface in data:
				if len(interfaces) != 0:
					if interface not in interfaces:
						continue
				output_string += interface
				output_string += ','
				for field in csv_fields:
					if field:
						output_string += str(data[interface][field])
						output_string += ","
				output_string += '\n'
			output.write(output_string)
		sys.exit(0)

	if all:
		with os.scandir("./") as dirfiles:
			files = filter(lambda name: name.name.endswith("throughput.json"), dirfiles)
			for file in files:
				if os.path.isfile(file.name):
					# If default namespace
					if len(file.name) == len("throughput.json"):
						print("Executed: ", [sys.argv[0], "-i", file.name, "-e", "-o", file.name])
						subprocess.run([sys.argv[0], "-i", file.name, "-e", "-o", file.name])
					else:
						# Execute in the namespaces
						netns = file.name[:-len(".throughput.json")]
						print("Executed: ", ["ip","netns","exec",netns,"bash","-c",sys.argv[0], "-i", file.name, "-e", "-o", file.name])
						subprocess.run(["ip","netns","exec",netns,"bash","-c",sys.argv[0], "-i", file.name, "-e", "-o", file.name])