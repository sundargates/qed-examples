//This program generated by a Python script.
#include <stdio.h>
#define lprintf for(int i = 0; i < level; i++) printf("  "); printf

int level = 0;


int i0();
int i1();
int i2();
int i3();
int i4();
int i5();
int i6();
int i7();
int i8();
int i9();
int i10();
int i11();

int i0() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi0\033[0m.\n");
	if (!called) {
		i2();
		i11();
		i8();
		i11();
		i1();
		i0();
		i0();
		i5();
		i4();
		i2();
		i7();
		i11();
		i2();
	}
	level--;
	return 0;
}

int i1() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi1\033[0m.\n");
	if (!called) {
		i8();
		i0();
		i8();
		i3();
		i10();
		i9();
		i9();
		i9();
		i7();
		i11();
		i10();
		i4();
		i2();
		i9();
		i2();
		i7();
		i1();
		i9();
		i10();
	}
	level--;
	return 0;
}

int i2() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi2\033[0m.\n");
	if (!called) {
		i7();
		i7();
		i5();
		i1();
		i4();
		i4();
		i9();
		i9();
	}
	level--;
	return 0;
}

int i3() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi3\033[0m.\n");
	if (!called) {
		i11();
		i11();
		i11();
		i5();
		i3();
		i4();
		i3();
	}
	level--;
	return 0;
}

int i4() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi4\033[0m.\n");
	if (!called) {
		i5();
		i6();
		i5();
		i7();
		i7();
		i3();
		i5();
	}
	level--;
	return 0;
}

int i5() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi5\033[0m.\n");
	if (!called) {
		i0();
		i3();
		i3();
		i10();
		i1();
		i11();
		i6();
		i3();
		i10();
		i2();
		i7();
	}
	level--;
	return 0;
}

int i6() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi6\033[0m.\n");
	if (!called) {
		i7();
		i7();
		i3();
		i1();
		i1();
		i1();
		i6();
		i6();
		i6();
		i9();
		i1();
		i6();
	}
	level--;
	return 0;
}

int i7() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi7\033[0m.\n");
	if (!called) {
		i6();
		i1();
		i0();
		i0();
		i1();
		i1();
		i10();
		i5();
		i11();
		i11();
		i5();
		i4();
		i4();
		i8();
		i5();
		i4();
		i1();
		i1();
	}
	level--;
	return 0;
}

int i8() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi8\033[0m.\n");
	if (!called) {
		i2();
		i5();
		i5();
		i8();
		i9();
		i3();
		i7();
		i5();
		i1();
		i7();
	}
	level--;
	return 0;
}

int i9() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi9\033[0m.\n");
	if (!called) {
		i5();
		i0();
		i1();
		i7();
		i0();
		i6();
		i7();
		i10();
		i3();
		i3();
		i2();
	}
	level--;
	return 0;
}

int i10() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi10\033[0m.\n");
	if (!called) {
		i1();
		i6();
		i3();
	}
	level--;
	return 0;
}

int i11() {
	static int called = -1;
	called++;
	level++;
	lprintf("Called \033[32mi11\033[0m.\n");
	if (!called) {
		i3();
		i1();
		i6();
		i11();
		i10();
		i6();
		i9();
		i11();
		i3();
		i1();
		i1();
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
		i8();
		i6();
		i2();
		i1();
		i11();
		i11();
		i9();
		i5();
	}
	level--;
	return 0;
}

