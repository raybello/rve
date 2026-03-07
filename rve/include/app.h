#ifndef APP_H
#define APP_H

// UI
#include <SDL.h>
#if defined(IMGUI_IMPL_OPENGL_ES2)
#include <SDL_opengles2.h>
#else
#define GL_GLEXT_PROTOTYPES
#include <SDL_opengl.h>
#endif
#ifdef __EMSCRIPTEN__
#include "emscripten_mainloop_stub.h"
#endif

// Std Library
#include <string>
// Dependencies
#include "imgui.h"
#include "imgui_impl_sdl2.h"
#include "imgui_impl_opengl3.h"
#include "implot.h"
// Utilities
#include "mem_editor.h"
#include "file_dialog.h"
// RISC core
#include "emu.h"

struct AppSettings
{
    std::string name = "RVE RISC-V Emulator";
    // std::string font = "assets/fonts/SFPro.ttf";
    std::string font = "assets/fonts/FiraCode-Regular.ttf";
    float font_size = 18.0f;

    // Window settings
    bool show_demo_window = false;      // Imgui Demo
    bool show_plot_demo_window = false; // Implot Demo
    bool show_terminal_window = true;
    bool show_cpu_state = true;
    bool show_disasm = true;

    // Emulator settings
};

static MemoryEditor mem_editor;

class App
{
    bool running;
    AppSettings settings;

    SDL_Window *window;
    SDL_WindowFlags window_flags;
    SDL_GLContext window_context;
    SDL_Event window_event;

    const char *glsl_version;
    ImVec4 window_bg_color;

    // Emulator
    Emulator emu;
    ImGui::FileBrowser elfFileDialog;
    ImGui::FileBrowser linuxFileDialog;

    // Framebuffer texture
    GLuint fb_texture_id = 0;
    static constexpr int FB_W = 720;
    static constexpr int FB_H = 405;

public:
    App(/* args */);
    ~App();
    int initializeWindow();
    int initializeUI();
    int destroyUI();
    int initializeEmu(int argc, char *argv[]);
    void stepEmu();
    // Rendering
    void beginRender();
    void endRender();
    void renderLoop();
    // UI
    void drawUI();
    void handleEvents();
    // Windows
    void createMenubar();
    void createTerminal();
    void createCpuState();
    void createDisasm();
};

#endif 