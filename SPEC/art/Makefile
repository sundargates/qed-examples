###############################################################################
# SPECtools2000
#   Version 0.3
#   This makefile should NOT be changed other than to customize for a 
#   particular benchmark.  Users may overide variables by placing them
#   in the Makefile.spec file.  Or by using the "runspec" program to 
#   build the Makefile.spec file for them.
###############################################################################
#	BENCHMARK	-- standard definitions for this benchmark

NUMBER    = 179
NAME      = art
EXEBASE   = art
BENCHLANG = C
SOURCES   = scanner.c
NEED_MATH = yes


# ALL Modes
# 1st bit - EDDI
# 2nd bit - CFTSS
# 3rd bit - CFCSS
# 4th bit - GlobalCFCSS

QED_MODE     = 3
NUM_CFTSS_BB = 10
OPTIMIZATION =
RUN_PARAMS   = -scanfile input/c756hel.in -trainfile1 input/a10.img -trainfile2 input/hc.img -stride 2 -startx 134 -starty 220 -endx 139 -endy 225 -objects 1

# Include standard template for this suite
-include ../../../../Makefile.defaults
-include ../../../Makefile.defaults
-include ../../Makefile.defaults
-include ../Makefile.defaults

nomakefiles:
	@echo "*** Whoops!  I didn't find a Makefile.defaults file."
	@echo "*** Your distribution is probably corrupt."
	@echo
