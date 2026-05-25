#include <libasm.h>

int error(char *str)
{
    perror(str);
    return 1;
}

int main(void) 
{
    const char  *str            = "A string";
    const char  *other_str      = "Another string";
    size_t size                 = ft_strlen(str) + 1;
    char                        *cpy;
    
    cpy = malloc(sizeof(*cpy) * size);
    if (cpy == NULL)
        return error("malloc");

    // -------------STRLEN----------------
    printf("_STRLEN_\n\n");

    size_t len = ft_strlen(str);
    printf("%zu\n", len);

    printf("-----------------------\n");
    // ------------WRITE------------------
    printf("_WRITE_\n\n");

    ft_write(1, str, ft_strlen(str));
    ft_write(1, "\n", 1);

    printf("-----------------------\n");
    // ------------STRCPY-----------------
    printf("_STRCPY_\n\n");

    ft_strcpy(cpy, str);
    printf("cpy: %s\n", cpy);

    printf("-----------------------\n");
    // ------------STRCMP-----------------
    printf("_STRCMP_\n\n");

    printf("ft_strcmp_cpy: %d\n", ft_strcmp(str, cpy));
    printf("strcmp_cpy: %d\n", strcmp(str, cpy));
    printf("ft_strcmp: %d\n", ft_strcmp(str, other_str));
    printf("strcmp: %d\n", strcmp(str, other_str));
    if (cpy)
        free(cpy);
        
    printf("-----------------------\n");
    // ------------READ-------------------
    printf("_READ_\n\n");

    int fd = open("./srcs/tests/test_read.txt", O_RDONLY);
    if (fd == -1)
        return error("open");
    char read_buf[100];

    ssize_t n = read(fd, read_buf, sizeof(read_buf) - 1);
    printf("read returned: %zd\n", n);
    if (n >= 0)
        read_buf[n] = '\0';
    printf("%s\n", read_buf);

    memset(read_buf, 0, sizeof(read_buf));
    lseek(fd, 0, SEEK_SET);
    n = ft_read(fd, read_buf, sizeof(read_buf) - 1);
    printf("read returned: %zd\n", n);
    if (n >= 0)
        read_buf[n] = '\0';
    printf("%s\n", read_buf);
    close(fd);

    printf("-----------------------\n");
    // ------------STRDUP--------------
    printf("_STRDUP_\n\n");

    char *new_str = ft_strdup("Une string et pas un string lol\n");
    printf("%s", new_str);
    free(new_str);

    printf("-----------------------\n");
    return 0;
}
