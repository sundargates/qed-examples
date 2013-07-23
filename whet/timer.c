/* If EDDI gets the time twice, what happens? For very exact measurements, the results
 * could very well differ.
 */
//This does happen. You have to duplicate the gettimeofday() call in the IR.
#include <sys/time.h>
#include <stdio.h>

int main() {
	struct timeval tv;
	gettimeofday(&tv, NULL);
	int msec = ((tv.tv_sec % 86400) * 1000 + tv.tv_usec / 1000);
	printf("%d\n", msec);
}
