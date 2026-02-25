#include "app.h"

static void HelpMarker(const char *desc)
{
    ImGui::TextDisabled("(?)");
    if (ImGui::BeginItemTooltip())
    {
        ImGui::PushTextWrapPos(ImGui::GetFontSize() * 35.0f);
        ImGui::TextUnformatted(desc);
        ImGui::PopTextWrapPos();
        ImGui::EndTooltip();
    }
}

static void showHelp()
{
    printf("./rve [parameters]\n\t-e [elf binary]\n\t-m [ram amount]\n\t-f [running image]\n\t-k [kernel command line]\n\t-b [dtb file, or 'disable']\n\t-c instruction count\n\t-s single step with full processor state\n\t-t time division base\n\t-l lock time base to instruction count\n\t-p disable sleep when wfi\n\t-d fail out immediately on all faults\n");
}

App::App(/* args */)
{
    printf("INFO: Starting %s\n", settings.name.c_str());
    window_bg_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
    running = true;
}

App::~App()
{
    printf("INFO: Closing %s\n", settings.name.c_str());
}

int App::initializeWindow()
{
    int status;
    status = SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER | SDL_INIT_GAMECONTROLLER);
    if (status != 0)
    {
        printf("Error: Failed to initialize window: %s\n", SDL_GetError());
    }

#ifdef SDL_HINT_IME_SHOW_UI
    SDL_SetHint(SDL_HINT_IME_SHOW_UI, "1");
#endif

    // Continue Setting up window
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);
    SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, 8);

// Decide GL+GLSL versions
#if defined(IMGUI_IMPL_OPENGL_ES2)
    // GL ES 2.0 + GLSL 100 (WebGL 1.0)
    glsl_version = "#version 100";
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, 0);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
#elif defined(IMGUI_IMPL_OPENGL_ES3)
    // GL ES 3.0 + GLSL 300 es (WebGL 2.0)
    glsl_version = "#version 300 es";
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, 0);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
#elif defined(__APPLE__)
    // GL 3.2 Core + GLSL 150
    glsl_version = "#version 150";
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG); // Always required on Mac
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);
#else
    // GL 3.0 + GLSL 130
    glsl_version = "#version 130";
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, 0);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
#endif

    // Create window
    window_flags = (SDL_WindowFlags)(SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI);
    window = SDL_CreateWindow(settings.name.c_str(), SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 1400, 800, window_flags);
    if (window == nullptr)
    {
        printf("Error: SDL_CreateWindow(): %s\n", SDL_GetError());
        return -1;
    }
    // Setup window context
    window_context = SDL_GL_CreateContext(window);
    SDL_GL_MakeCurrent(window, window_context);
#ifndef __EMSCRIPTEN__
    SDL_GL_SetSwapInterval(0); // Enable vsync
#endif
    return 0;
}

int App::initializeUI()
{
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImPlot::CreateContext();
    ImGuiIO &io = ImGui::GetIO();
    (void)io;

    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;
    io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;
#ifndef __EMSCRIPTEN__
    io.ConfigFlags |= ImGuiConfigFlags_ViewportsEnable; // Enable Multi-Viewport / Platform Windows
#endif

    // Setup fonts
    io.Fonts->AddFontFromFileTTF(settings.font.c_str(), settings.font_size);
    // Setup Theme
    ImGui::StyleColorsDark();
    // Setup Style
    ImGuiStyle &style = ImGui::GetStyle();
    if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable)
    {
        style.WindowRounding = 5.0f;
        style.FrameRounding = 5.0f;
        style.PopupRounding = 5.0f;
        style.Colors[ImGuiCol_WindowBg].w = 0.5f;
    }
    // Setup backend
    ImGui_ImplSDL2_InitForOpenGL(window, window_context);
    ImGui_ImplOpenGL3_Init(glsl_version);

    printf("INFO: GLSL Version: %s\n", glGetString(GL_SHADING_LANGUAGE_VERSION));
    glEnable(GL_DEPTH_TEST);

    return 0;
}

int App::initializeEmu(int argc, char *argv[])
{

    // Start emulator
    emu = Emulator();
    emu.initialize();

    int i;
    int show_help = 0;

    // Filenames
    const char *elf_file_name = 0;
    const char *bin_file_name = 0;
    const char *dtb_file_name = 0;

    for (i = 1; i < argc; i++)
    {
        const char *param = argv[i];
        int param_continue = 0;

        do
        {
            if (param[0] == '-' || param_continue)
            {
                switch (param[1])
                {
                case 'b':
                    bin_file_name = (++i < argc) ? argv[i] : 0;
                    break;
                case 'd':
                    dtb_file_name = (++i < argc) ? argv[i] : 0;
                    break;
                case 'e':
                    elf_file_name = (++i < argc) ? argv[i] : 0;
                    break;
                case 's':
                    param_continue = 1;
                    emu.debugMode = true;
                    break;
                case 'r':
                    param_continue = 1;
                    emu.running = true;
                    break;
                default:
                    if (param_continue)
                        param_continue = 0;
                    else
                        show_help = 1;
                    break;
                }
            }
            else
            {
                show_help = 1;
                break;
            }
            param++;
        } while (param_continue);
    }

    // Handle commands
    if (show_help || ((argc == 2) && !strcmp(argv[1], "--help")))
    {
        showHelp();
        running = false;
        return 1;
    }

    if (elf_file_name)
    {
        printf("INFO: ELF File: %s\n", elf_file_name);
        emu.initializeElf(elf_file_name);
    }
    if (bin_file_name)
    {
        printf("INFO: Binary File: %s\n", bin_file_name);
    }
    if (dtb_file_name)
    {
        printf("INFO: DTB File: %s\n", dtb_file_name);
    }

    return 0;
}

void App::beginRender()
{
    // Start Render Frame
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplSDL2_NewFrame();
    ImGui::NewFrame();
}

void App::endRender()
{
    ImGui::Render();
    ImGuiIO &io = ImGui::GetIO();
    (void)io;

    glViewport(0, 0, (int)io.DisplaySize.x, (int)io.DisplaySize.y);

    glClearColor(window_bg_color.x * window_bg_color.w, window_bg_color.y * window_bg_color.w, window_bg_color.z * window_bg_color.w, window_bg_color.w);

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    ////////////// RENDER END //////////////

    ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
#ifndef __EMSCRIPTEN__
    if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable)
    {
        SDL_Window *backup_current_window = SDL_GL_GetCurrentWindow();
        SDL_GLContext backup_current_context = SDL_GL_GetCurrentContext();
        ImGui::UpdatePlatformWindows();
        ImGui::RenderPlatformWindowsDefault();
        SDL_GL_MakeCurrent(backup_current_window, backup_current_context);
    }
#endif
    SDL_GL_SwapWindow(window);
}

void App::handleEvents()
{
    while (SDL_PollEvent(&window_event))
    {
        ImGui_ImplSDL2_ProcessEvent(&window_event);
        if (window_event.type == SDL_QUIT)
        {
            running = false;
        }
        if (window_event.type == SDL_WINDOWEVENT && window_event.window.event == SDL_WINDOWEVENT_CLOSE && window_event.window.windowID == SDL_GetWindowID(window))
        {
            running = false;
        }
    }
    if (SDL_GetWindowFlags(window) & SDL_WINDOW_MINIMIZED)
    {
        SDL_Delay(10);
    }
}

int App::destroyUI()
{
    ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplSDL2_Shutdown();
    ImPlot::DestroyContext();
    ImGui::DestroyContext();

    SDL_GL_DeleteContext(window_context);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}

void App::drawUI()
{
    createMenubar();

    if (settings.show_demo_window)
        ImGui::ShowDemoWindow(&settings.show_demo_window);

    if (settings.show_plot_demo_window)
        ImPlot::ShowDemoWindow(&settings.show_plot_demo_window);

    if (settings.show_terminal_window)
        createTerminal();

    if (settings.show_cpu_state)
        createCpuState();

    if (settings.show_disasm)
        createDisasm();
}

void App::renderLoop()
{
#ifdef __EMSCRIPTEN__
    ImGuiIO &io = ImGui::GetIO();
    (void)io;
    io.IniFilename = nullptr;
    MainLoopForEmscriptenP = [&]()
    { do
#else
    while (running)
#endif
    {
        stepEmu();
        handleEvents();
        beginRender();
        drawUI();
        endRender();
    }
#ifdef __EMSCRIPTEN__
    while (0); };
    emscripten_set_main_loop(MainLoopForEmscripten, 0, true);
#endif
}

void App::createMenubar()
{
    if (ImGui::BeginMainMenuBar())
    {
        if (ImGui::BeginMenu("File"))
        {
            if (ImGui::MenuItem("Create New Scene", "Ctrl+N"))
            {
                printf("Create New Scene\n");
            }
            if (ImGui::MenuItem("Load Scene", "Ctrl+O"))
            {
                printf("Load Scene\n");
            }
            if (ImGui::MenuItem("Save Scene", "Ctrl+S"))
            {
                printf("Save Scene\n");
            }
            if (ImGui::MenuItem("Exit", "Ctrl+X"))
            {
                printf("INFO: Exit requested\n");
                running = false;
            }
            ImGui::EndMenu();
        }
        if (ImGui::BeginMenu("Edit"))
        {
            ImGui::MenuItem("Undo", "CTRL+Z");
            ImGui::MenuItem("Redo", "CTRL+Y");
            ImGui::Separator();
            ImGui::MenuItem("Cut", "CTRL+X");
            ImGui::MenuItem("Copy", "CTRL+C");
            ImGui::MenuItem("Paste", "CTRL+V");
            ImGui::EndMenu();
        }
        if (ImGui::BeginMenu("Views"))
        {
            ImGui::MenuItem("Terminal", NULL, &settings.show_terminal_window);
            ImGui::MenuItem("Demo Window", NULL, &settings.show_demo_window);
            ImGui::MenuItem("Plot Demo Window", NULL, &settings.show_plot_demo_window);
            ImGui::MenuItem("CPU State", NULL, &settings.show_cpu_state);
            ImGui::MenuItem("Disassembler", NULL, &settings.show_disasm);
            ImGui::EndMenu();
        }
        ImGuiIO &io = ImGui::GetIO();
        (void)io;
        ImGui::Text("avg %.3f ms/frame %.1f fps", 1000.0f / io.Framerate, io.Framerate);

        ImGui::EndMainMenuBar();
    }
}

void App::createTerminal()
{
    ImGuiIO &io = ImGui::GetIO();
    (void)io;
    ImGui::Begin("Terminal");
    ImGui::Checkbox("Demo Window", &settings.show_demo_window);
    ImGui::ColorEdit3("BG Color", (float *)&window_bg_color);
    ImGui::Text("Application average %.3f ms/frame %.1f fps", 1000.0f / io.Framerate, io.Framerate);

    static char buf1[256] = "ls -al";
    ImGui::InputText("Command-line", buf1, 256);
    static std::string text;

    if (ImGui::Button("Send"))
    {
        printf("Command: %s\n", buf1);
    }
    ImGui::End();
}

void App::createCpuState()
{
    ImGui::Begin("CPU State", NULL, ImGuiWindowFlags_MenuBar);

    elfFileDialog.Display();
    if (elfFileDialog.HasSelected())
    {
        emu.elf_file_path = elfFileDialog.GetSelected().string();
        elfFileDialog.ClearSelected();
    }
    linuxFileDialog.Display();
    if (linuxFileDialog.HasSelected())
    {
        emu.bin_file_path = linuxFileDialog.GetSelected().string();
        linuxFileDialog.ClearSelected();
    }

    // Menubar
    if (ImGui::BeginMenuBar())
    {
        if (ImGui::BeginMenu("Settings"))
        {
            // Menu Items
            ImGui::MenuItem("Debug-Mode", NULL, &emu.debugMode);

            ImGui::EndMenu();
        }
        if (ImGui::BeginMenu("Actions"))
        {
            ImGui::EndMenu();
        }
        if (ImGui::BeginMenu("Clock"))
        {
            ImGui::InputInt("Clock Freq.", &emu.clk_freq_sel, 1);
            ImGui::EndMenu();
        }
        ImGui::EndMenuBar();
    }

    // Memory Loading
    if (ImGui::CollapsingHeader("Memory Loader"))
    {
        { // ELF Loading
            if (ImGui::Button("1.Select ELF"))
            {
                elfFileDialog.SetTitle("Select ELF file");
                elfFileDialog.Open();
            }
            ImGui::SameLine();
            if (ImGui::Button("2.Load ELF"))
            {
                emu.initializeElf(emu.elf_file_path.c_str());
            }
            ImGui::SameLine();
            ImGui::Text("%s", emu.elf_file_path.c_str());
        }
        { // Linux Loading
            if (ImGui::Button("1.Select IMG"))
            {
                linuxFileDialog.SetTitle("Select Linux image");
                linuxFileDialog.Open();
            }
            ImGui::SameLine();
            if (ImGui::Button("2.Load IMG"))
            {
                emu.initializeElf(emu.bin_file_path.c_str());
            }
            ImGui::SameLine();
            ImGui::Text("%s", emu.bin_file_path.c_str());
        }
    }
    // Start/Stop/Step/Reset
    ImGui::SeparatorText("Commands");
    if (ImGui::Button("Start/Stop"))
    {
        if (emu.ready_to_run)
        {
            emu.running = !emu.running;
        }
        else
        {
            printf("Not ready to execute. Memory maybe corrupted\n");
        }
    }
    ImGui::SameLine();
    if (ImGui::Button("Step"))
    {
    }
    ImGui::SameLine();
    if (ImGui::Button("Reset"))
    {
        emu.running = false;
        emu.ready_to_run = false;
        emu.initialize();
    }

    // Registers & Control Signals
    ImGui::SeparatorText("Registers");
    if (ImGui::BeginTable("CPU Registers", 4))
    {
        for (int i = 0; i < 32; i++)
        {
            ImGui::TableNextColumn();

            ImGui::Text("%s: 0x%04X", rv_regs[i], emu.cpu.xreg[i]);
        }
        ImGui::EndTable();
        HelpMarker("CPU Registers x0-31");
    }
    ImGui::SeparatorText("Control Signals");
    if (ImGui::BeginTable("Control Signals", 3))
    {
        {
            ImGui::TableNextColumn();
            ImGui::Text("PC: 0x%04X", emu.cpu.pc);
            ImGui::TableNextColumn();
            ImGui::Text("Clock: 0x%04X", emu.cpu.clock);
            ImGui::TableNextColumn();
            ImGui::Text("DebugMode: %s", emu.debugMode ? "Enabled" : "Disabled");
            ImGui::TableNextColumn();
            ImGui::Text("Rsrv en: 0x%04X", emu.cpu.reservation_en);
            ImGui::TableNextColumn();
            ImGui::Text("Rsrv addr: 0x%04X", emu.cpu.reservation_addr);
            ImGui::TableNextColumn();
            ImGui::Text("Running: %s", emu.running ? "Running" : "Halted");
        }
        ImGui::EndTable();
    }

    // RAM
    ImGui::SeparatorText("RAM");
    mem_editor.DrawContents(emu.memory, emu.MEM_SIZE, 0x80000000);

    ImGui::End();
}

void App::createDisasm()
{
    static u32 prev_pc;
    const int buffer_size = 30;
    static char buf[buffer_size][80];
    static u32 pc[buffer_size];


    ImGui::Begin("Tools");

    ImGui::BeginTabBar("Tool Tabs");
    if (ImGui::BeginTabItem("Disassembler"))
    {
        if (prev_pc != emu.cpu.pc)
        {
            // Remove the oldest element by shifting elements down
            for (size_t i = 0; i < buffer_size - 1; ++i)
            {
                pc[i] = pc[i + 1];
                std::memcpy(buf[i], buf[i + 1], sizeof(buf[i]));
            }

            // Append the new data at the end
            disasm_inst(buf[buffer_size - 1], sizeof(buf[buffer_size - 1]), rv32, emu.cpu.pc, emu.cpu.memGetWord(emu.cpu.pc));
            prev_pc = emu.cpu.pc;
            pc[buffer_size - 1] = prev_pc;
        }

        for (int i = 0; i < buffer_size; i++)
        {
            ImGui::Text("%08" PRIx32 ":  %s\n", pc[i], buf[i]);
        }

        ImGui::EndTabItem();
    }
    if (ImGui::BeginTabItem("Source Code"))
    {
        ImGui::Button("Compile Code");

        ImGui::EndTabItem();
    }
    ImGui::EndTabBar();

    ImGui::End();
}

void App::stepEmu()
{
    if (emu.running)
    {
        // ImGuiIO io = ImGui::GetIO();
        ImGuiIO &io = ImGui::GetIO();
        (void)io;

        emu.time_sum += 1.0 / io.Framerate; // seconds

        if (emu.clk_freq_sel != -1)
        {
            if (emu.time_sum >= emu.sec_per_cycle)
            {
                emu.time_sum = 0; // reset timer

                emu.emulate();

                emu.sec_per_cycle = 1.0 / std::max(1, emu.clk_freq_sel);
            }
        }
        else
        {
            emu.emulate();
        }
    }
}