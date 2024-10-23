#include <stdio.h>
#include <stddef.h>
#include <unistd.h>

#include <errno.h>


extern size_t ft_strlen(const char *str);
extern char *ft_strcpy(char *dest, const char *src);
extern char *ft_strdup(char *str);
// extern char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
int ft_write(int fd, const void *buf, size_t count);

void test_errno(int fd, char *buff, int len) {
	int real_errno = 0, real_ret = 0;
	int my_errno = 0, my_ret = 0;
	
	errno = 0;
	real_ret = write(fd, buff, len);
	real_errno = errno;

	errno = 0;
	my_ret = ft_write(fd, buff, len);
	my_errno = errno;

	printf("fd: %d | len: %d\n", fd, len);
	printf("Real errno: %d | My errno: %d\n", real_errno, my_errno);
	printf("Real ret: %d | My ret: %d\n", real_ret, my_ret);
}

int main(int argc, char const *argv[])
{
	// test
	// test_errno(1, "Hello World!\n", 13);
	// test_errno(1, "Hello World!\n", 0);
	// test_errno(1, "Hello World!\n", 1);
	// test_errno(-1, "Hello World!\n", 13);
	// // test null
	// test_errno(1, NULL, 13);

	// test strdup
	printf("strdup: %s\n", ft_strdup("Hello World!"));
	printf("strdup: %s\n", ft_strdup(""));
	printf("strdup: %s\n", ft_strdup(NULL));
	return (0);
}
