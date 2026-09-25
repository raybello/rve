#ifndef LOADER_H
#define LOADER_H

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <iterator>
#include <cstring>
#include <elf.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <assert.h>
#include <sys/mman.h>


struct ElfSection
{
    uint32_t addr_real;
    uint32_t offset;
    uint32_t size;
    std::vector<uint8_t> sData;
};

// Function to load a Linux image from the specified file path into memory.
// Parameters:
// - path: A pointer to a constant character array representing the file path of the Linux image.
// - path_len: An unsigned 64-bit integer indicating the length of the file path string.
// - data: A pointer to an array of uint8_t where the image data will be loaded.
// - data_len: An unsigned 64-bit integer specifying the size of the data buffer.
int loadLinuxImage(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len);

// Function to load an ELF (Executable and Linkable Format) file from the given file path into memory.
// Parameters:
// - path: A pointer to a constant character array that specifies the file path of the ELF file.
// - path_len: An unsigned 64-bit integer representing the length of the file path string.
// - data: A pointer to a uint8_t array where the contents of the ELF file will be stored.
// - data_len: An unsigned 64-bit integer defining the size of the data buffer provided.
// https : // stackoverflow.com/questions/13908276/loading-elf-file-in-c-in-user-space
int loadElf(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len, uint64_t *entry = nullptr);

// Function to load a binary file from the specified file path into the provided memory buffer.
// Parameters:
// - path: A pointer to a constant character array indicating the file path of the binary file.
// - path_len: An unsigned 64-bit integer that holds the length of the file path string.
// - data: A pointer to an array of uint8_t intended to store the binary file data.
// - data_len: An unsigned 64-bit integer denoting the capacity of the data buffer available for loading.
int loadBin(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len);

#endif