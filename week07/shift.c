#include <stdio.h>
#include <stdint.h>

int main(void) {
	int num = -100;			
	printf("original number: %d\n", num); // -100 = 1001 1100
	printf("new number: %d\n", num >> 1); // -50 = 1100 1110
}
