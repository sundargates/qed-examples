#!/bin/bash

# This script runs a single fault injection and tests it. The goal is to develop
# a testing framework for this that is less... ad hoc than the previous version I
# employed for branch-only testing.

# Usage: ../scripts/eddi_file_tester program.qed
# (invoked from one of the llvm/ or hand/ subdirectories)

# Arun Debray, 15 August 2013

modfile=$1.mod

# This function runs the process for a specified amount of time, and then kills it if it  hasn't
# stopped. This is necessary because some faults cause the program to enter an infinite loop, and
# repeated testing doesn't play well with such loops.

# Invoked as: timeout (time) command
# where time is in seconds.
timeout() {
	time=$1
	# start the command in a subshell to avoid problem with pipes
	# (spawn accepts one command)
	command="/bin/sh -c \"$2\""
	expect -c "set echo \"-noecho\"; set timeout $time; spawn -noecho $command; expect timeout { exit 1 } eof { exit 0 }"
	if [ $? = 1 ] ; then
		echo "Timeout after ${time} seconds"
	fi
}

# At first, most of the errors that EDDI and CFCSS didn't catch were due to bit flips in the string
# section of the executable. That's not the most relevant question right now (and not how the authors
# of the EDDI paper tested, since they just looked at the code section), so I had the program check
# that the error was placed in the code section of the executable.

# It's probably possible to fix this to only modify the code section rather than guessing and check-
# ing, but that requires knowing more about the Mac OS X executable layout than I currently do, and
# this is still reasonably fast.
touch correct incorrect
until [ "$(diff -N correct incorrect)" != "" ]; do
	../scripts/faultInjector.py -exec $1 $modfile
	# Note: I do not know if otool is the platform-independent solution. I seem to recall reading
	# that the standard Unix command is something else to disassemble executables.
	otool -tv $1 > correct
	sed '1d' correct > correct2
	otool -tv $modfile > incorrect
	sed '1d' incorrect > incorrect2
	mv correct2 correct
	mv incorrect2 incorrect
	if [ "$(diff -N correct incorrect)" != "" ]; then
		break;
	fi
done
rm -f correct incorrect

# The timeout could be different for different files. Feel free to adjust this parameter.
timeout 5 ./$modfile
rm $modfile
