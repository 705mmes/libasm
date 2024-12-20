#include <libasm.h>
     
int main() {
    // FT_STRLEN

    const char *str = "Hello, World!";
    // printf("String to check: %s\n", str);
    // printf("Calculated length with ft_strlen: %zu\n", ft_strlen(str));
    // printf("Calculated length with strlen: %zu\n", strlen(str));

    //_________________________________________________________________
    // FT_STRCPY

    // printf("String to copy: %s\n", str);
    // char *copy = malloc(strlen(str) + 1); //strlen(str) calculates the actual length of the string, while sizeof(str) gives the size of the str pointer.
    // char *ft_copy = malloc(strlen(str) + 1);
    // if (!copy || !ft_copy)
    // {
    //     printf("Failed to allocate\n");
    //     return (1);
    // }
    // printf("Allocated size: copy=%ld ft_copy=%ld\n", malloc_usable_size(copy), malloc_usable_size(ft_copy));
    // ft_strcpy(ft_copy, str);
    // strcpy(copy, str);
    // printf("New string from ft_strcpy: %s\n", ft_copy);
    // printf("New ptr from ft_strcpy: %p\n", ft_copy);
    // printf("New string from strcpy: %s\n", copy);
    // printf("New ptr from strcpy: %p\n", copy);
    // free(copy);
    // free(ft_copy);

    //_________________________________________________________________
    // FT_STRCMP

    // const char *s1 = "Helxloo";
    // const char *s2 = "Worldeu";
    // printf("Strings to compare: %s, %s\n", s1, s2);
    // printf("Comparaison result of ft_strcmp: %d\n", ft_strcmp(s1, s2));
    // printf("Comparaison result of strcmp: %d\n", strcmp(s1, s2));

    //_________________________________________________________________
    // FT_WRITE
    // char *invalid_buffer = (char *)0x12345678;  // Adresse invalide
    // int b_write = write(1, invalid_buffer, strlen(str));
    // printf("[ write output = %d]\n", b_write);
    // printf("errno = %d\n", errno);
    // printf("ft_write\n[");
    // int ft_b_write = ft_write(-1, str, strlen(str));
    // printf(" ft_write output = %d]\n", ft_b_write);
    // printf("errno = %d\n", errno);

    //_________________________________________________________________
    // FT_READ
    // int fd2 = open("./srcs/tests/test_read.txt",0);
    // if (fd2 == -1)
    // {
    //     perror("Error opening file");
    // }
    // int fd1 = open("./srcs/tests/ft_test_read.txt",0);
    // if (fd1 == -1)
    // {
    //     perror("Error opening file");
    // }
    // char *readtest = malloc(11);
    // int b_read = read(fd2, readtest, 11);
    // printf("read output = %d\n", b_read);
    // printf("read = %s\n", readtest);
    // printf("errno = %d\n", errno);

    // char *ft_readtest = malloc(11);
    // int ft_b_read = ft_read(fd1, ft_readtest, 11);
    // printf("ft_read output = %d\n", ft_b_read);
    // printf("ft_read = %s\n", ft_readtest);
    // printf("errno = %d\n", errno);
    // close(fd2);

    //_________________________________________________________________
    // FT_STRDUP
    char *ft_new_str = ft_strdup(str);
    char *new_str = strdup(str);
    printf("New string from ft_strdup: %s\n", ft_new_str);
    printf("New string from strdup: %s\n", new_str);
    return 0;
}
