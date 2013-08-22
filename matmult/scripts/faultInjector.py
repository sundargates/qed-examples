#!/usr/bin/env python

import random
import stat
import sys

from subprocess import call

# Usage: ./faultInjector infile outfile

# This program creates a modified version of a file, which differs by a random bit.
# It is intended to be useful for testing Quick Error Detection, particularly for EDDI.

# Arun Debray, 15 August 2013

if __name__ == '__main__':
	with open(sys.argv[1 + offset], 'rb') as f, open(sys.argv[2 + offset], 'wb') as g:
		arr = bytearray(f.read())
		i = random.randrange(0, len(arr))
		arr[i] = arr[i] ^ random.choice([2 ** n for n in range(8)])
		g.write(arr)
		call(["chmod", "+x", sys.argv[2 + offset]])
