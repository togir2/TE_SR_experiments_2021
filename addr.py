#!/usr/bin/env python3

import socket

# Class which calculates the IP addresses to be used as network addresses at the interfaces.
class V6Net(object):
	def __init__(self, net, mask, submask):
		self.net = net
		self.mask = mask
		self.submask = submask
		# Convert IP address from string "net" to Packed Binary Format
		self.bnet = socket.inet_pton(socket.AF_INET6, self.net)
		self.curnet = bytearray(self.bnet)
		self.assigned = 0
		self.max_net = 2**(self.submask - self.mask)

		self.idx_high = self.mask/8
		self.idx_low = self.submask/8 - 1

	# Calculate the next network address to be used.
	def next_net(self):
		i = self.idx_low

		while i >= self.idx_high:
			if self.curnet[int(i)] == 0xff:
				self.curnet[int(i)] = 0
				i -= 1
			else:
				self.curnet[int(i)] += 1
				break

		if i < self.idx_high:
			raise Exception("Out of nets !")

		return self.curnet
