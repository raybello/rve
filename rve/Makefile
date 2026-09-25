
MAKEFLAGS += -j$(shell nproc 2>/dev/null || sysctl -n hw.logicalcpu)

CXX = g++
CC  = gcc

# XLEN=32 (default) builds build/rve, XLEN=64 builds build64/rve64
XLEN ?= 32
ifeq ($(XLEN),64)
BUILD_DIR = build64
EXE = rve64
CXXFLAGS += -DXLEN=64
else
BUILD_DIR = build
EXE = rve
endif

SOURCE_DIR = src
INCLUDE_DIR = include
ASSETS_DIR = assets
IMGUI_DIR  = lib/imgui
IMPLOT_DIR = lib/implot
DISASM_DIR = lib/disasm
ELFPARSER_DIR = lib/elf-parser

# RISCV ISA Tests
ISA_TEST_DIR = $(ASSETS_DIR)/isa-test
ISA_TEST  ?= rv32ua-p-lrsc
ISAFLAGS ?= -re
ISA_TEST_FILES = $(filter-out %.dump, $(notdir $(wildcard $(ISA_TEST_DIR)/*)))

# Create build directory if it doesn't exist
$(shell mkdir -p $(BUILD_DIR))

# Source Files
SOURCES =  $(SOURCE_DIR)/main.cpp
SOURCES += $(SOURCE_DIR)/rv32.cpp $(SOURCE_DIR)/emu.cpp $(SOURCE_DIR)/loader.cpp $(SOURCE_DIR)/app.cpp $(SOURCE_DIR)/net.cpp $(SOURCE_DIR)/headless.cpp $(SOURCE_DIR)/plic.cpp $(SOURCE_DIR)/virtio_net.cpp $(SOURCE_DIR)/usernet.cpp $(SOURCE_DIR)/netsetup.cpp
# ImGui Files
SOURCES += $(IMGUI_DIR)/imgui.cpp $(IMGUI_DIR)/imgui_demo.cpp $(IMGUI_DIR)/imgui_draw.cpp $(IMGUI_DIR)/imgui_tables.cpp $(IMGUI_DIR)/imgui_widgets.cpp
SOURCES += $(IMGUI_DIR)/backends/imgui_impl_sdl2.cpp $(IMGUI_DIR)/backends/imgui_impl_opengl3.cpp
# ImPlot Files
SOURCES += $(IMPLOT_DIR)/implot.cpp $(IMPLOT_DIR)/implot_items.cpp $(IMPLOT_DIR)/implot_demo.cpp
# Disasm Files
SOURCES += $(DISASM_DIR)/disasm.cpp

# Setup objects
CPP_SOURCES := $(filter %.cpp, $(SOURCES))
C_SOURCES   := $(filter %.c, $(SOURCES))
# Source Object files
OBJS := $(addprefix $(BUILD_DIR)/, $(notdir $(CPP_SOURCES:.cpp=.o) )) 
OBJS += $(addprefix $(BUILD_DIR)/, $(notdir $(C_SOURCES:.c=.o) ))

UNAME_S := $(shell uname -s)


# Compiler include 
CXXFLAGS += -I$(SOURCE_DIR) -I$(INCLUDE_DIR)
CXXFLAGS += -I$(IMGUI_DIR) -I$(IMGUI_DIR)/backends -I$(IMGUI_DIR)/examples/libs/emscripten
CXXFLAGS += -I$(IMPLOT_DIR) -I$(DISASM_DIR)

# Source Includes
LIBS = 

# Build flags per platform
ifeq ($(UNAME_S), Linux)
    ECHO_MESSAGE = "Linux"
	LIBS += -lGL -ldl `sdl2-config --libs`
    CXXFLAGS += `sdl2-config --cflags`
    # LIBS += -lGL -ldl `$$(SDL_DIR)/sdl2-config --libs`
    # CXXFLAGS += `$$(SDL_DIR)/sdl2-config --cflags`
endif

ifeq ($(UNAME_S), Darwin) #APPLE
	ECHO_MESSAGE = "Mac OS X"
	LIBS += -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo `sdl2-config --libs`
	LIBS += -L/usr/local/lib

	CXXFLAGS += `sdl2-config --cflags`
	CXXFLAGS += -I/usr/local/include -I/opt/local/include
	CFLAGS = $(CXXFLAGS)
endif

ifeq ($(OS), Windows_NT)
	ECHO_MESSAGE = "MinGW"
	LIBS += -lgdi32 -lopengl32 -limm32 `pkg-config --static --libs sdl2`

	CXXFLAGS += `pkg-config --cflags sdl2`
	CFLAGS = $(CXXFLAGS)
endif

# C & C++ Compiler flags
CXXFLAGS += -g -O2 -Wall -Wformat
CCFLAGS  := $(CXXFLAGS)
CXXFLAGS += -std=c++17

# Build rules
$(BUILD_DIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(IMGUI_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(IMGUI_DIR)/backends/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(IMPLOT_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: $(DISASM_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/$(EXE): $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)


# Build commands
all: $(BUILD_DIR)/$(EXE)
	@echo ============ Build complete for $(ECHO_MESSAGE) ============

web: clean_web
	@echo ============ Building for Web on $(ECHO_MESSAGE) ============
	make -f Makefile.emscripten serve

clean_web:
	rm -rf web

run: all
	./$(BUILD_DIR)/$(EXE)

isa:
	$(MAKE) clean
	$(MAKE) CXXFLAGS="$(CXXFLAGS) -DRVE_ISA_TEST" $(BUILD_DIR)/$(EXE)
	@echo ============ $(ISA_TEST) ============
	./$(BUILD_DIR)/$(EXE) $(ISAFLAGS) $(ISA_TEST_DIR)/$(ISA_TEST)
	@echo =====================================

isas-gui:
	$(MAKE) clean
	$(MAKE) CXXFLAGS="$(CXXFLAGS) -DRVE_ISA_TEST" $(BUILD_DIR)/$(EXE)
	@$(foreach test, $(ISA_TEST_FILES), \
	  echo "=== $(test) ==="; \
	  ./$(BUILD_DIR)/$(EXE) $(ISAFLAGS) $(ISA_TEST_DIR)/$(test); \
	)

# Headless ISA regression: prints PASS/FAIL/TIMEOUT per test, exits non-zero on any failure
ISA_RV64_DIR = $(ASSETS_DIR)/isa-test-rv64
# rve's own directed RV64 tests (CSR/satp WARL behaviour), see rve/tests/rv64
ISA_RV64_RVE_DIR = $(ASSETS_DIR)/isa-test-rv64-rve
# Sv39 virtual-memory (-v-) variants of the rv64 tests
ISA_RV64_V_DIR = $(ASSETS_DIR)/isa-test-rv64-v

isas32:
	$(MAKE) XLEN=32 all
	../scripts/run_isa.sh build/rve $(ISA_TEST_DIR)

isas64:
	$(MAKE) XLEN=64 all
	../scripts/run_isa.sh build64/rve64 $(ISA_RV64_DIR)
	../scripts/run_isa.sh build64/rve64 $(ISA_RV64_RVE_DIR)

isas64-v:
	$(MAKE) XLEN=64 all
	../scripts/run_isa.sh build64/rve64 $(ISA_RV64_V_DIR)

isas: isas32

# Serialized on purpose: isas64 and isas64-v share build64/ and MAKEFLAGS enables -j
isas-all:
	$(MAKE) -j1 isas32
	$(MAKE) -j1 isas64
	$(MAKE) -j1 isas64-v

linux-clean:
	@echo ============ Cleaning Linux Test ============
	rm -rf $(BUILD_DIR)/Image $(BUILD_DIR)/linux-6.1.14-rv32nommu-cnl-1.zip

linux-dl:
	@echo ============ Downloading Linux Image ============ 
	wget https://github.com/cnlohr/mini-rv32ima-images/raw/master/images/linux-6.1.14-rv32nommu-cnl-1.zip -O $(BUILD_DIR)/linux-6.1.14-rv32nommu-cnl-1.zip
	unzip $(BUILD_DIR)/linux-6.1.14-rv32nommu-cnl-1.zip -d $(BUILD_DIR)

linuxn: all linux-clean linux-dl
	@echo ============ Running Linux Test ============
	./$(BUILD_DIR)/$(EXE) -n -b $(BUILD_DIR)/Image

linux: all linux-clean linux-dl
	@echo ============ Running Linux Test ============
	./$(BUILD_DIR)/$(EXE) -r -b $(BUILD_DIR)/Image

# RV64 Linux (OpenSBI + Sv39 kernel built by `make build ARCH=rv64`, see docker/container.mk)
LINUX64_IMAGE = $(ASSETS_DIR)/linux64/Image

lnx64:
	$(MAKE) XLEN=64 all
	./build64/rve64 -r -b $(LINUX64_IMAGE)

# headless (UART on stdout / stdin)
linuxn64:
	$(MAKE) XLEN=64 all
	./build64/rve64 -n -b $(LINUX64_IMAGE)

lnx: clean
	make all && \
	echo '============ Copying Linux Image ============' && \
	cp -f $(ASSETS_DIR)/linux/Image $(BUILD_DIR)/Image && \
	echo '============ Running Linux ============' && \
	./$(BUILD_DIR)/$(EXE) -r -b $(BUILD_DIR)/Image

rerun: clean
	make run

net-test:
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/net_pair_test \
		$(SOURCE_DIR)/net.cpp tests/net_pair_test.cpp
	./$(BUILD_DIR)/net_pair_test
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $(BUILD_DIR)/virtio_net_test \
		$(SOURCE_DIR)/virtio_net.cpp $(SOURCE_DIR)/plic.cpp tests/virtio_net_test.cpp
	./$(BUILD_DIR)/virtio_net_test
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $(BUILD_DIR)/usernet_test \
		$(SOURCE_DIR)/usernet.cpp tests/usernet_test.cpp
	./$(BUILD_DIR)/usernet_test

clean:
	rm -rf build/* build64/*