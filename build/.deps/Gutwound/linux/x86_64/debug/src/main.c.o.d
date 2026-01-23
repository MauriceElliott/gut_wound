{
    files = {
        "src/main.c"
    },
    depfiles_format = "gcc",
    values = {
        "/usr/bin/gcc",
        {
            "-m64",
            "-fPIC",
            "-g",
            "-O0",
            "-I/home/maurice/PlaydateSDK/C_API",
            "-DDEBUG",
            "-Wall",
            "-Wextra",
            "-Wno-unused-parameter",
            "-DTARGET_EXTENSION=1"
        }
    },
    depfiles = "main.o: src/main.c /home/maurice/PlaydateSDK/C_API/pd_api.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_file.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_gfx.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_sys.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_lua.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_json.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_sprite.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_sound.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_display.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_scoreboards.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_network.h  /home/maurice/PlaydateSDK/C_API/pd_api/pd_api_sys.h\
"
}