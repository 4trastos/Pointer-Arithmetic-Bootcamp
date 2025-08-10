#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct s_buffer {
    char *data;
    int size;
} t_buffer;

void init_buffer(t_buffer *buf) {
    buf->size = 100;
    buf->data = malloc(buf->size + 1);
    if (!buf->data) return;
    memset(buf->data, 'A', buf->size);
    buf->data[buf->size] = '\0';
}

void free_buffer(t_buffer *buf) {
    if (buf->data) free(buf->data);
}

int main(void) {
    t_buffer buf = {NULL, 0};
    init_buffer(&buf);
    printf("%s\n", buf.data);
    free_buffer(&buf);
    return 0;
}
