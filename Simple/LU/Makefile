###############################################################################
# SPECtools2000
#   Version 0.3
#   This makefile should NOT be changed other than to customize for a 
#   particular benchmark.  Users may overide variables by placing them
#   in the Makefile.spec file.  Or by using the "runspec" program to 
#   build the Makefile.spec file for them.
###############################################################################
#	BENCHMARK	-- standard definitions for this benchmark

# ALL Modes
# 1st bit - EDDI
# 2nd bit - CFTSS
# 3rd bit - CFCSS
# 4th bit - GlobalCFCSS

SOURCES      = lu.c
QED_MODE     = 3
NUM_CFTSS_BB = 10
APPLICATION  = lu
OPTIMIZATION = -O3
BENCHLANG    = C
MACROS       = c.m4.null.POSIX_BARRIER
BENCH_FLAGS  = -pthread -D_POSIX_C_SOURCE=200112


# Include standard template for this suite
-include ../../../../Makefile.defaults
-include ../../../Makefile.defaults
-include ../../Makefile.defaults
-include ../Makefile.defaults

nomakefiles:
	@echo "*** Oops!  I didn't find a Makefile.defaults file. "
	@echo