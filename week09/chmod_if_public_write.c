// remove public write from specified as command line arguments if needed
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdint.h>

void chmod_if_needed(char *pathname);

int main(int argc, char *argv[]) {
    for (int arg = 1; arg < argc; arg++) {
        chmod_if_needed(argv[arg]);
    }
    return 0;
}

// chmod a file if publically-writeable
void chmod_if_needed(char *pathname) {
	// stat the file
	struct stat s;
	if (stat(pathname, &s) != 0) {
		perror(pathname);
		exit(1);
	}
	// check if the file is publically writeable or nah
	if ((s.st_mode & S_IWOTH) == 0) {
		printf("%s is not publically writeable", pathname);
		return;
	}
    printf("removing public write from %s\n", pathname);

	// Removing the write public flag (using a new mode)
	uint16_t new_mode = s.st_mode & (~S_IWOTH); // ~S_IWOTH = 111 111 101 
		
	// change the file permission to the new mode 
	if (chmod(pathname, new_mode) != 0) {
		perror(pathname);
		exit(1);
	}
}
