
#include "loader.h"


int loadLinuxImage(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len)
{
    (void)path_len;
    std::ifstream file(path, std::ios::binary | std::ios::ate);
    if (!file.is_open())
    {
        fprintf(stderr, "ERRO: Failed to open Linux image: %s\n", path);
        return 1;
    }

    std::streamsize file_size = file.tellg();
    file.seekg(0, std::ios::beg);

    if (static_cast<uint64_t>(file_size) > data_len)
    {
        fprintf(stderr, "ERRO: Linux image too large (%ld bytes) for buffer (%lu bytes)\n",
                (long)file_size, (unsigned long)data_len);
        return 2;
    }

    if (!file.read(reinterpret_cast<char *>(data), file_size))
    {
        fprintf(stderr, "ERRO: Failed to read Linux image\n");
        return 3;
    }

    printf("INFO: Loaded Linux image: %ld bytes\n", (long)file_size);
    return 0;
}

int loadBin(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len)
{
    return loadLinuxImage(path, path_len, data, data_len);
}

// Load an ELF32/ELF64 executable by copying its PT_LOAD segments into RAM.
// Physical addresses at/above RAM_BASE (0x80000000) map to data[paddr - RAM_BASE].
// If entry is non-null it receives e_entry.
int loadElf(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len, uint64_t *entry)
{
    (void)path_len;
    const uint64_t RAM_BASE = 0x80000000ull;

    std::ifstream file(path, std::ios::binary);
    if (!file.is_open())
    {
        printf("ERRO: Failed to open ELF file: %s\n", path);
        return 1;
    }
    std::vector<uint8_t> img((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());

    if (img.size() < EI_NIDENT || memcmp(img.data(), ELFMAG, SELFMAG) != 0)
    {
        printf("ERRO: ELFMAGIC mismatch!\n");
        return 2;
    }

    bool is64 = img[EI_CLASS] == ELFCLASS64;
    if (!is64 && img[EI_CLASS] != ELFCLASS32)
    {
        printf("ERRO: unknown ELF class\n");
        return 3;
    }

    uint64_t e_entry, e_phoff;
    uint32_t e_phnum, e_phentsize;
    if (is64)
    {
        if (img.size() < sizeof(Elf64_Ehdr)) return 2;
        Elf64_Ehdr eh;
        memcpy(&eh, img.data(), sizeof(eh));
        e_entry = eh.e_entry; e_phoff = eh.e_phoff; e_phnum = eh.e_phnum; e_phentsize = eh.e_phentsize;
    }
    else
    {
        if (img.size() < sizeof(Elf32_Ehdr)) return 2;
        Elf32_Ehdr eh;
        memcpy(&eh, img.data(), sizeof(eh));
        e_entry = eh.e_entry; e_phoff = eh.e_phoff; e_phnum = eh.e_phnum; e_phentsize = eh.e_phentsize;
    }

    for (uint32_t i = 0; i < e_phnum; i++)
    {
        uint64_t off = e_phoff + (uint64_t)i * e_phentsize;
        uint32_t p_type;
        uint64_t p_offset, p_paddr, p_filesz, p_memsz;
        if (is64)
        {
            if (off + sizeof(Elf64_Phdr) > img.size()) return 4;
            Elf64_Phdr ph;
            memcpy(&ph, img.data() + off, sizeof(ph));
            p_type = ph.p_type; p_offset = ph.p_offset; p_paddr = ph.p_paddr;
            p_filesz = ph.p_filesz; p_memsz = ph.p_memsz;
        }
        else
        {
            if (off + sizeof(Elf32_Phdr) > img.size()) return 4;
            Elf32_Phdr ph;
            memcpy(&ph, img.data() + off, sizeof(ph));
            p_type = ph.p_type; p_offset = ph.p_offset; p_paddr = ph.p_paddr;
            p_filesz = ph.p_filesz; p_memsz = ph.p_memsz;
        }
        if (p_type != PT_LOAD || p_memsz == 0)
            continue;

        uint64_t dst = p_paddr >= RAM_BASE ? p_paddr - RAM_BASE : p_paddr;
        if (dst + p_memsz > data_len || p_offset + p_filesz > img.size())
        {
            printf("ERRO: ELF segment too big or offset too great\n");
            return 6;
        }
        memcpy(data + dst, img.data() + p_offset, p_filesz);
        memset(data + dst + p_filesz, 0, p_memsz - p_filesz);
    }

    if (entry)
        *entry = e_entry;
    return 0;
}

int loadBinary(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len)
{
    // Ensure the path is null-terminated
    std::string filepath(path, path_len);

    // Print the path of the binary file being loaded
    std::cout << "Loading binary file '" << filepath << "'" << std::endl;

    // Open the binary file
    std::ifstream file(filepath, std::ios::binary | std::ios::ate);
    if (!file.is_open())
    {
        std::cerr << "Failed to open binary file: " << filepath << std::endl;
        throw std::runtime_error("File open failed");
    }

    // Get file size
    std::streamsize file_size = file.tellg();
    file.seekg(0, std::ios::beg);

    // Check if the file size exceeds the provided buffer size
    if (static_cast<uint64_t>(file_size) > data_len)
    {
        std::cerr << "Binary file too large for provided buffer" << std::endl;
        throw std::runtime_error("Buffer too small");
    }

    // Read the file content into the provided buffer
    if (!file.read(reinterpret_cast<char *>(data), file_size))
    {
        std::cerr << "Failed to read binary file" << std::endl;
        throw std::runtime_error("File read failed");
    }

    // Report success
    std::cout << "Successfully loaded binary file, size: " << file_size << " bytes" << std::endl;

    return 0;
}