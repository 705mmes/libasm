#ifndef LIBASM_H
#define LIBASM_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stddef.h>
#include <malloc.h>

extern size_t   ft_strlen(const char *s);
extern char     *ft_strcpy(char *dest, const char *src);
extern int      ft_strcmp(const char *s1, const char *s2);
extern ssize_t  ft_write(int fd, const void *buf, size_t count);
extern ssize_t  ft_read(int fd, void *buf, size_t count);
extern char     *ft_strdup(const char *s);

#endif