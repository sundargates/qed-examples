/* This is a valid program on which EDDI fails, and I don't think the fault is
   with EDDI. Basically, the way it is implemented, both copies of the instruc-
   tions point to the same file object. This means that when fgets() is called,
   it isn't cloned, since it's a function call, and thus the two strings differ
   and the later check fails. To the extent that I know anything about EDDI,
   file reading doesn't seem like the kind of instruction that will be run in
   parallel, so maybe this is OK.

   As for solutions, there are a few: we could ignore it and make a note that
   this doesn't work on file reading. Alternatively, one could make two file
   objects that read the same file... while that would solve this specific
   problem, I can guess that there are lots of intricate ways to trip EDDI
   up and it might not be the best use of time to patch each and every more
   complicated one.
 */

#include <stdio.h>

int main(int argc,char** argv) {
	FILE* infile = fopen("Makefile","r");
	char line_buf[257];
	fgets(line_buf, 256, infile);
	printf("Got the line:\033[32m %s\033[0m\n", line_buf);
	if (line_buf[0] == '#') printf("Skipping.\n");
	return 0;
}
