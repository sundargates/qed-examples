###############################################################################
# SPECtools2000
#   Version 0.3
#   This makefile should NOT be changed other than to customize for a 
#   particular benchmark.  Users may overide variables by placing them
#   in the Makefile.spec file.  Or by using the "runspec" program to 
#   build the Makefile.spec file for them.
###############################################################################
#	BENCHMARK	-- standard definitions for this benchmark

NUMBER       = 181
NAME         = mcf
EXEBASE      = mcf
BENCHLANG    = C
SOURCES      = mcf.c mcfutil.c readmin.c implicit.c pstart.c output.c \
	    treeup.c pbla.c pflowup.c psimplex.c pbeampp.c
NEED_MATH    = yes
BENCH_FLAGS  = -DWANT_STDC_PROTO

# ALL Modes
# 1st bit - EDDI
# 2nd bit - CFTSS
# 3rd bit - CFCSS
# 4th bit - GlobalCFCSS

QED_MODE     = 3
NUM_CFTSS_BB = 40
APPLICATION  = mcf
OPTIMIZATION = -O3
BENCHLANG    = C

# Include standard template for this suite
-include ../../../../Makefile.defaults
-include ../../../Makefile.defaults
-include ../../Makefile.defaults
-include ../Makefile.defaults

nomakefiles:
	@echo "*** Whoops!  I didn't find a Makefile.defaults file."
	@echo "*** Your distribution is probably corrupt."
	@echo
