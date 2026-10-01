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
#include <cstdint>
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
#include "profiler.h"

struct AppSettings
{
    std::string name = "RVE RISC-V Emulator";
    // std::string font = "assets/fonts/SFPro.ttf";
    std::string font = "assets/fonts/FiraCode-Regular.ttf";
    float font_size = 18.0f;

    // Window settings
    bool show_demo_window = false;      // Imgui Demo
    bool show_plot_demo_window = false; // Implot Demo
    bool show_cpu_state = true;
    bool show_disasm = true;
    bool show_profiler = false;         // Profiling metrics (ImPlot)
    // "Guest Display": a real, decorated OS window on native (movable, closable via its own
    // close button); wasm has no OS-level multi-window support, so there it's a regular docked
    // ImGui panel instead. Same virtio-gpu framebuffer either way -- see createDisplayPanel()
    // (Emscripten) / createDisplayWindow() (native). On by default on both platforms.
    bool show_display_window = true;

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
#ifdef RVE_PROFILE
    Profiler profiler;
#endif

    // Framebuffer texture, backed by the guest's virtio-gpu scanout (rve/include/virtio_gpu.h).
    // Sized to whatever the guest last negotiated; FB_W/FB_H are only the initial allocation,
    // matching virtio-gpu's own default before any guest command changes the resolution.
    GLuint fb_texture_id = 0;
    static constexpr int FB_W = 850;
    static constexpr int FB_H = 478;
    int fb_tex_w = FB_W, fb_tex_h = FB_H; // currently-allocated texture size
    uint64_t last_gpu_frame_gen = 0;      // last VirtioGpu::frameGeneration() uploaded

    // Dedicated guest-display window (M2 of the GUI-userspace plan): shows exactly the virtio-gpu
    // scanout at native resolution, sharing the main GL context. A normal decorated OS window
    // (title bar, draggable, closable via its own close button), not borderless. Native builds
    // only -- SDL2 on Emscripten/wasm has no multi-window support, so createDisplayPanel() below
    // covers the same role there via a docked ImGui panel instead.
#ifndef __EMSCRIPTEN__
    SDL_Window *display_window = nullptr;
    GLuint display_shader_program = 0;
    GLuint display_vao = 0, display_vbo = 0;
    int display_win_w = 0, display_win_h = 0;
    void createDisplayWindow();
    void destroyDisplayWindow();
    void renderDisplayWindow();
#endif

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
    void updateFramebufferTexture();
    void createDisplayPanel();
    void createCpuState();
    void createDisasm();
    void createProfiler();
};

#endif 