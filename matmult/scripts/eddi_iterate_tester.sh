#!/bin/bash

# The second level of EDDI testing.
# This program does a bunch of trials, each one corresponding to a different fault injection.
# It does assume that the programs (the QED program and the regular one) have already been compiled.

# Usage: ../scripts/eddi_iterate_tester.sh program.qed num_trials

# Arun Debray, August 15, 2013

filename="${1%.*}"

# Model output, that the modified output is compared against
../llvm/matmul.native > correct.err

other=0 # Tracking errors caught by the OS
nochange=0 # The count of how many programs ran with no difference to the printed output
notcaught=0 # Errors which caused the printed output to differ, but were not caught by EDDI
surprise=0 # Unexpected exits (i.e. before normal termination of the program)
loop=0 # Infinite loops created
eddi=0 # Errors caught by EDDI

i=0

# Warning: I am not certain if jot is Mac-specific. If so, there's probably a better alternative
# for Linux & co. to parse an int.
for i in `jot $2`; do
	i=`expr $i + 1`
	../scripts/eddi_file_tester.sh $1 &> test.err
	# If you run this on a different architecture than Mac OS X, the OS error messages will probably
	# be different, and you'll need to adjust this list to remedy that.
	# These errors are those that are caught by the OS before the executable even runs.
	if grep --quiet "Malformed Mach-o file" test.err ||
	   grep --quiet "Cannot allocate memory" test.err ||
	   grep --quiet "Library not loaded" test.err ||
	   grep --quiet "Bad CPU type in executable" test.err ||
	   grep --quiet "cannot execute binary file" test.err ||
	   grep --quiet "Symbol not found" test.err ||
	   grep --quiet "dyld" test.err; then
		other=`expr $other + 1`
	# Test whether EDDI caught the fault
	elif grep --quiet "EDDI Failed." test.err; then
		eddi=`expr $eddi + 1`
	# Signal raised by the timeout() function in eddi_file_tester.sh
	elif grep --quiet Timeout test.err; then
		loop=`expr $loop + 1`
	elif [ "$(diff --strip-trailing-cr correct.err test.err)" != "" ]; then
		# This is the last printed line, so if it is absent, then the program exited abnormally early.
		if grep --quiet "Complete" test.err; then
			notcaught=`expr $notcaught + 1`
		else
			surprise=`expr $surprise + 1`
		fi
#		echo $i:
#		cat test.err
	else
		nochange=`expr $nochange + 1`
	fi
	rm test.err
done
i=`expr $i - 1`

printf "Out of %d trials of the EDDI file tester, there were:\n\t%d errors caught by EDDI,\n\t%d errors that terminated, but weren't caught,\n\t%d unexpected exits,\n\t%d errors that created infinite loops,\n\t%d other errors (didn't run), and\n\t%d correct programs.\n" "$i" "$eddi" "$notcaught" "$surprise" "$loop" "$other" "$nochange"

rm correct.err
