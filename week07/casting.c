#include <stdio.h>
#include <stdint.h>

int main(void) {
	int8_t num = -1;
	printf("%u\n", (uint32_t)(uint8_t) num);
	printf("%u\n", (uint32_t)(int32_t) num);
}
