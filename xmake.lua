-- xmake configuration for Playdate C project

set_project("Gutwound")
set_version("0.1.0")

-- Define build targets
add_rules("mode.debug", "mode.release")

-- Get Playdate SDK path from environment
local playdate_sdk = os.getenv("PLAYDATE_SDK_PATH")
if not playdate_sdk then
    raise("PLAYDATE_SDK_PATH environment variable not set!")
end

-- Define the game target
target("Gutwound")
    set_kind("shared")
    set_extension(".so")

    -- Source files
    add_files("src/*.c")

    -- Include directories
    add_includedirs(path.join(playdate_sdk, "C_API"))

    -- Compiler flags
    add_cflags("-Wall", "-Wextra", "-Wno-unused-parameter")
    add_cflags("-DTARGET_EXTENSION=1")

    -- Debug/Release specific flags
    if is_mode("debug") then
        add_defines("DEBUG")
        set_symbols("debug")
        set_optimize("none")
    else
        set_symbols("hidden")
        set_optimize("fastest")
    end

    -- After build, package with pdc
    after_build(function (target)
        local pdc = path.join(playdate_sdk, "bin/pdc")
        local pdx_output = ".builds/Gutwound.pdx"

        -- Copy built binary to Source/ directory (follows Playdate SDK convention)
        -- Source/ should contain pdxinfo and receives the compiled binary
        os.cp(target:targetfile(), "src/pdex.so")

        -- Run pdc to package Source/ directory into .pdx bundle
        os.execv(pdc, {"src", pdx_output})

        cprint("${bright green}✓${clear} Built %s", pdx_output)
    end)

-- Generate compile_commands.json for LSP
add_rules("plugin.compile_commands.autoupdate", {outputdir = "."})
