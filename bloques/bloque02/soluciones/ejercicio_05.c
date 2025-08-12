#include <stdio.h>
#include <stdlib.h>

int main() {
    int arr[4] = {2,4,6,8};
    int *ptr = arr;
    int len = sizeof(arr) / sizeof(arr[0]) -1;
    int result = 0;

    while (len >= 0)
    {
	    result = result + *ptr;
	    ptr++;
	    len--;
    }
    printf("%d\n", result);
    return 0;
}
