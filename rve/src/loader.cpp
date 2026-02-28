
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

int loadElf(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len)
{

    // Open in binary mode
    uint32_t fd = open(path, O_RDONLY | O_SYNC);
    if (fd <= 0) {
        printf("ERRO: Failed to open ELF file\n");
        return 1;
    }
    printf("INFO: %s Opened ELF file: %s\n", __func__, path);

    /* ELF header : at start of file */
    Elf32_Ehdr eh;
    if (lseek(fd, 0, SEEK_SET) == -1 || read(fd, &eh, sizeof(eh)) != sizeof(eh))
    {
        printf("ERRO: Failed to read ELF header\n");
        close(fd);
        return 2;
    }

    printf("INFO: %s Read %ld bytes of ELF32 Header\n", __func__, sizeof(Elf32_Ehdr));

    if (memcmp(eh.e_ident, ELFMAG, SELFMAG) != 0)
    {
        printf("ERRO: ELFMAGIC mismatch!\n");
        close(fd);
        return 2;
    }

    if (eh.e_ident[EI_CLASS] == ELFCLASS64)
    {
        printf("ERRO: 64b ELF. Currently unsupported...\n");
        close(fd);
        return 3;
    }
    else if (eh.e_ident[EI_CLASS] == ELFCLASS32)
    {
        std::vector<Elf32_Shdr> sh_tbl(eh.e_shnum);
        if (lseek(fd, eh.e_shoff, SEEK_SET) == -1 ||
            read(fd, sh_tbl.data(), eh.e_shentsize * eh.e_shnum) != eh.e_shentsize * eh.e_shnum)
        {
            printf("ERRO: Error reading section headers\n");
            close(fd);
            return 4;
        }
        printf("INFO: %s Read %ld bytes of section headers\n", __func__, sizeof(eh.e_shentsize * eh.e_shnum));

        std::vector<ElfSection> sections;

        for (const auto &sh : sh_tbl)
        {
            if (sh.sh_type == SHT_PROGBITS)
            {
                ElfSection section{sh.sh_addr & 0x7FFFFFFF, sh.sh_offset, sh.sh_size};
                sections.push_back(std::move(section));
            }
        }

        for (auto &section : sections)
        {
            section.sData.resize(section.size);
            if (lseek(fd, section.offset, SEEK_SET) == -1 ||
                read(fd, section.sData.data(), section.size) != section.size)
            {
                printf("ERRO: Error reading section data\n");
                close(fd);
                return 5;
            }
            printf("INFO: %s Read %0d bytes of section data\n", __func__, section.size);

            if (section.addr_real + section.size > data_len)
            {
                printf("ERRO: ELF section too big or offset too great\n");
                close(fd);
                return 6;
            }
            std::copy(section.sData.begin(), section.sData.end(), data + section.addr_real);
        }

        printf("INFO: %s Loaded ELF file: %s\n", __func__, path);
    }
    close(fd);
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