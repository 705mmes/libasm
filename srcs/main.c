#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <malloc.h>

extern size_t   ft_strlen(const char *s);
extern char     *ft_strcpy(char *dest, const char *src);
extern int      ft_strcmp(const char *s1, const char *s2);
     
int main() {
    // FT_STRLEN

    // const char *str = "Hello, World!";
    // printf("String to check: %s\n", str);
    // printf("Calculated length with ft_strlen: %zu\n", ft_strlen(str));
    // printf("Calculated length with strlen: %zu\n", strlen(str));

    //_________________________________________________________________
    // FT_STRCPY

    // const char *str = "Hello, World!";
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
    ...

    return 0;
}
