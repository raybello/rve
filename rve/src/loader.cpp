
#include "loader.h"
#include <algorithm>


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
// If entry is non-null it receives e_entry; if tohost is non-null it receives the
// address of the "tohost" symbol (riscv-tests HTIF exit mailbox), or 0 if absent.
int loadElf(const char *path, uint64_t path_len, uint8_t *data, uint64_t data_len, uint64_t *entry, uint64_t *tohost)
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

    if (tohost)
    {
        *tohost = 0;
        uint64_t e_shoff;
        uint32_t e_shnum, e_shentsize;
        if (is64)
        {
            Elf64_Ehdr eh; memcpy(&eh, img.data(), sizeof(eh));
            e_shoff = eh.e_shoff; e_shnum = eh.e_shnum; e_shentsize = eh.e_shentsize;
        }
        else
        {
            Elf32_Ehdr eh; memcpy(&eh, img.data(), sizeof(eh));
            e_shoff = eh.e_shoff; e_shnum = eh.e_shnum; e_shentsize = eh.e_shentsize;
        }
        auto shdr = [&](uint32_t idx, uint32_t &type, uint64_t &off, uint64_t &size, uint32_t &link, uint64_t &entsize) {
            uint64_t o = e_shoff + (uint64_t)idx * e_shentsize;
            if (is64)
            {
                if (o + sizeof(Elf64_Shdr) > img.size()) return false;
                Elf64_Shdr sh; memcpy(&sh, img.data() + o, sizeof(sh));
                type = sh.sh_type; off = sh.sh_offset; size = sh.sh_size; link = sh.sh_link; entsize = sh.sh_entsize;
            }
            else
            {
                if (o + sizeof(Elf32_Shdr) > img.size()) return false;
                Elf32_Shdr sh; memcpy(&sh, img.data() + o, sizeof(sh));
                type = sh.sh_type; off = sh.sh_offset; size = sh.sh_size; link = sh.sh_link; entsize = sh.sh_entsize;
            }
            return true;
        };
        for (uint32_t i = 0; i < e_shnum; i++)
        {
            uint32_t type, link; uint64_t off, size, entsize;
            if (!shdr(i, type, off, size, link, entsize) || type != SHT_SYMTAB || entsize == 0)
                continue;
            uint32_t st_type, st_link; uint64_t st_off, st_size, st_entsize;
            if (!shdr(link, st_type, st_off, st_size, st_link, st_entsize))
                continue;
            for (uint64_t k = 0; k < size / entsize; k++)
            {
                uint64_t so = off + k * entsize;
                uint32_t name; uint64_t value;
                if (is64)
                {
                    if (so + sizeof(Elf64_Sym) > img.size()) break;
                    Elf64_Sym sym; memcpy(&sym, img.data() + so, sizeof(sym));
                    name = sym.st_name; value = sym.st_value;
                }
                else
                {
                    if (so + sizeof(Elf32_Sym) > img.size()) break;
                    Elf32_Sym sym; memcpy(&sym, img.data() + so, sizeof(sym));
                    name = sym.st_name; value = sym.st_value;
                }
                if (st_off + name + 7 <= img.size() &&
                    strncmp((const char *)img.data() + st_off + name, "tohost", 7) == 0)
                {
                    *tohost = value;
                    return 0;
                }
            }
        }
    }
    return 0;
}

int loadElfSymbols(const char *path, std::vector<ElfSymbol> &out)
{
    out.clear();
    std::ifstream file(path, std::ios::binary);
    if (!file.is_open())
        return 1;
    std::vector<uint8_t> img((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    if (img.size() < EI_NIDENT || memcmp(img.data(), ELFMAG, SELFMAG) != 0)
        return 2;
    bool is64 = img[EI_CLASS] == ELFCLASS64;
    if (!is64 && img[EI_CLASS] != ELFCLASS32)
        return 3;

    uint64_t e_shoff;
    uint32_t e_shnum, e_shentsize;
    if (is64)
    {
        if (img.size() < sizeof(Elf64_Ehdr)) return 2;
        Elf64_Ehdr eh; memcpy(&eh, img.data(), sizeof(eh));
        e_shoff = eh.e_shoff; e_shnum = eh.e_shnum; e_shentsize = eh.e_shentsize;
    }
    else
    {
        if (img.size() < sizeof(Elf32_Ehdr)) return 2;
        Elf32_Ehdr eh; memcpy(&eh, img.data(), sizeof(eh));
        e_shoff = eh.e_shoff; e_shnum = eh.e_shnum; e_shentsize = eh.e_shentsize;
    }

    struct Sh { uint32_t type, link; uint64_t off, size, entsize; };
    auto shdr = [&](uint32_t idx, Sh &sh) {
        uint64_t o = e_shoff + (uint64_t)idx * e_shentsize;
        if (is64)
        {
            if (o + sizeof(Elf64_Shdr) > img.size()) return false;
            Elf64_Shdr h; memcpy(&h, img.data() + o, sizeof(h));
            sh = {h.sh_type, h.sh_link, h.sh_offset, h.sh_size, h.sh_entsize};
        }
        else
        {
            if (o + sizeof(Elf32_Shdr) > img.size()) return false;
            Elf32_Shdr h; memcpy(&h, img.data() + o, sizeof(h));
            sh = {h.sh_type, h.sh_link, h.sh_offset, h.sh_size, h.sh_entsize};
        }
        return true;
    };

    for (uint32_t i = 0; i < e_shnum; i++)
    {
        Sh sym, str;
        if (!shdr(i, sym) || sym.type != SHT_SYMTAB || sym.entsize == 0 || !shdr(sym.link, str))
            continue;
        for (uint64_t k = 0; k < sym.size / sym.entsize; k++)
        {
            uint64_t so = sym.off + k * sym.entsize;
            uint32_t name; uint64_t value, size; uint8_t info; uint16_t shndx;
            if (is64)
            {
                if (so + sizeof(Elf64_Sym) > img.size()) break;
                Elf64_Sym s; memcpy(&s, img.data() + so, sizeof(s));
                name = s.st_name; value = s.st_value; size = s.st_size; info = s.st_info; shndx = s.st_shndx;
            }
            else
            {
                if (so + sizeof(Elf32_Sym) > img.size()) break;
                Elf32_Sym s; memcpy(&s, img.data() + so, sizeof(s));
                name = s.st_name; value = s.st_value; size = s.st_size; info = s.st_info; shndx = s.st_shndx;
            }
            uint8_t type = info & 0xf; // 0 NOTYPE (asm labels), 2 FUNC
            if (shndx == 0 || (type != 0 && type != 2) || str.off + name >= img.size())
                continue;
            const char *nm = (const char *)img.data() + str.off + name;
            size_t maxlen = img.size() - (str.off + name);
            size_t len = strnlen(nm, maxlen);
            if (len == 0 || nm[0] == '$' || nm[0] == '.') // mapping symbols, local labels
                continue;
            out.push_back({value, size, std::string(nm, len)});
        }
    }
    std::stable_sort(out.begin(), out.end(), [](const ElfSymbol &a, const ElfSymbol &b) { return a.addr < b.addr; });
    return 0;
}

const ElfSymbol *findElfSymbol(const std::vector<ElfSymbol> &syms, uint64_t addr)
{
    auto it = std::upper_bound(syms.begin(), syms.end(), addr,
                               [](uint64_t a, const ElfSymbol &s) { return a < s.addr; });
    // A sized symbol (FUNC) owns [addr, addr+size); a zero-size label (asm labels, linker symbols like
    // _end) only claims the next 64 KiB so unrelated addresses are not attributed to it.
    const uint64_t LABEL_REACH = 0x10000;
    while (it != syms.begin())
    {
        --it;
        uint64_t off = addr - it->addr;
        if (it->size ? off < it->size : off < LABEL_REACH)
            return &*it;
        if (off > LABEL_REACH) // everything earlier is farther still
            break;
    }
    return nullptr;
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