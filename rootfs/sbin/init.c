#include <stdio.h>
#include <unistd.h>

int main() {
	printf("printf test lol\n");
	write(1, "this is Grad LinuxTM\nenjoy\n", 27);
	// while (1) {}
	return 0;
}