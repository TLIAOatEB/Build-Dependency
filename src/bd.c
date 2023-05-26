#include <stdio.h>
#define MAJOR 0
#define MINOR 0
#define PATCH 1

void print_version_build_dependency(void)
{
    printf("Build Dependency version: %d.%d.%d\n", MAJOR, MINOR, PATCH);
    return;
}

int bd(void)
{
    print_version_build_dependency();
    return 0;
}
