#include <stdio.h>

int main() {
    int arr[6] = {0,1,2,3,4,5};
    int *ptr = arr;
    int *last;
    int i = sizeof(arr) / sizeof(arr[0]) -1;

    last = ptr + (sizeof(arr) / sizeof(arr[0]) -1);
    while (i >= 0)
    {
	    printf("%d", *last);
	    last--;
	    i--;
    }
    return 0;
}
