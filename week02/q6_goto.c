// A simple program demonstrating how to represent a implementing an && in an
// if-statement in MIPS.
// This version: Simplified C.

#include <stdio.h>

int main(void) { int x;

    printf("Enter a number: ");
    scanf("%d", &x);

    // Combined, these two conditional branches effectively implement an && as it
    // would be in a single if-statement.
    if (x <= 100) goto main_print_small_big;

    if (x >= 1000) goto main_print_small_big;

    // This becomes the else-case of the if-statement.
    printf("medium\n");
    goto epilogue;

main_print_small_big:
    printf("small/big\n");

main_epilogue:
    return 0;
}
