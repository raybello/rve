#ifndef SHIM_STRING_H
#define SHIM_STRING_H
typedef __SIZE_TYPE__ size_t;
void *memcpy(void *, const void *, size_t);
void *memset(void *, int, size_t);
size_t strlen(const char *);
int memcmp(const void *, const void *, size_t);
#endif
