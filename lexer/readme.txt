This directory contains a lexer for C, generated with a flex file. It's been useful for me as a larger test program.

It's particularly noteworthy because its function yy_fatal_error() doesn't return, since it calls exit(). When I implemented CFCSS around function calls, it initially didn't work with this program because unreachable blocks are never mapped into bb_id_map and I had assumed that it had an ID. This is fixed now, but hopefully it will be a useful test file for others as well.

Compiling it requires the compiler flag -lfl, to incorporate the Flex library.
