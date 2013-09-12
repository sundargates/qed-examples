SOURCES      = bzip2.c spec.c

# ALL Modes
# 1st bit - EDDI
# 2nd bit - CFTSS
# 3rd bit - CFCSS
# 4th bit - GlobalCFCSS

QED_MODE     = 3
NUM_CFTSS_BB = 10
APPLICATION  = bzip2
OPTIMIZATION = -O3
BENCHLANG    = C

# Include standard template for this suite
-include ../Makefile.defaults

nomakefiles:
	@echo "*** Oops!  I didn't find a Makefile.defaults file. "
	@echo