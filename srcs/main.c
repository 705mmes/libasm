#include <stdio.h>

extern size_t ft_strlen(const char *str);

int main() 
{
    const char *testStr = "Hello, world!";
    size_t length = ft_strlen(testStr); // Call the assembly function
    printf("Length of string: %zu\n", length);
    return 0;
}
