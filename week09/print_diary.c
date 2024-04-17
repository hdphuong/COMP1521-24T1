// print $HOME/.diary to stdout
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *basename = ".diary";
// $HOME/.diary
int main(int argc, char *argv[]) {
    // Get the environment variable containing the home directory.
	char *homepath = getenv("HOME");
    
	// In the unlikely case HOME isn't set, set home to current directory.
	if (homepath == NULL) {
		homepath = ".";
	} 

    // Calculate pathname length of $HOME/.diary
	int pathname_length = strlen(homepath) + strlen(basename) + 2; // '/' and null terminator
    
    // Allocate enough room for the pathname (name it diary_pathname)
	char *pathname = malloc(pathname_length);

    // Put "$HOME/.diary" into variable diary_pathname.
	snprintf(pathname, pathname_length, "%s/%s", homepath, basename); // 
		
    //  Attempt to open up created path
	FILE *fp = fopen(pathname, "r");
	// TODO: error handling if fp == null ...

	printf("%s\n", pathname);

	int c;
	while ((c = fgetc(fp)) != EOF)  {
		fputc(c, stdout);
	}

    // Clean up once we're done.
	free(pathname);
	fclose(fp);
    return 0;
}
