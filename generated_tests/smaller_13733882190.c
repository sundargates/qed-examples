//This program generated by a Python script.
#include <stdio.h>
#define lprintf for(int i = 0; i < level; i++) printf("  "); printf

int level = 0;


int i0();

int i0() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi0\033[0m.\n");
	if (!called) {
		i0();
	}
	level--;
	return 0;
}

int main() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mmain\033[0m.\n");
	if (!called) {
		i0();
	}
	level--;
	return 0;
}
