# Gutwound

A survival game for Playdate, converted from Picotron.

## Prerequisites

### Playdate SDK
1. Download and install the [Playdate SDK](https://play.date/dev/)
2. Set the `PLAYDATE_SDK_PATH` environment variable:

**Linux/macOS (bash/zsh):**
```bash
export PLAYDATE_SDK_PATH=$HOME/PlaydateSDK
```

**Linux/macOS (fish):**
```fish
set -Ux PLAYDATE_SDK_PATH $HOME/PlaydateSDK
```

**Windows:**
```
set PLAYDATE_SDK_PATH=C:\Path\To\PlaydateSDK
```

Add this to your shell configuration file (`.bashrc`, `.zshrc`, `config.fish`, etc.) to make it permanent.

### Lua Language Server (Optional but Recommended)

For enhanced code completion, type checking, and inline documentation in your editor:

1. **Install lua-language-server:**
   - **macOS:** `brew install lua-language-server`
   - **Linux:** Download from [GitHub releases](https://github.com/LuaLS/lua-language-server/releases) or use your package manager
   - **Windows:** Download from [GitHub releases](https://github.com/LuaLS/lua-language-server/releases)

2. **LuaCATS annotations for Playdate API:**
   This repository includes `.playdate-luacats` which provides type definitions and documentation for the Playdate SDK. The `.luarc.json` file is already configured to use it.

## Editor Setup

### Helix

Helix uses the Language Server Protocol (LSP) for code intelligence. The project includes a `.helix/languages.toml` configuration file.

1. **Ensure lua-language-server is in your PATH:**
   ```bash
   which lua-language-server  # Should return a path
   ```

2. **The project `.helix/languages.toml` is already configured** to use lua-language-server for Lua files.

3. **Open the project in Helix:**
   ```bash
   hx source/main.lua
   ```

4. **You should see:**
   - Autocompletion for Playdate API functions
   - Inline documentation on hover (use `Space + k`)
   - Type checking and diagnostics
   - Support for Playdate-specific operators (`+=`, `-=`, etc.)

**Note:** If you prefer global Helix configuration instead of project-specific, add the contents of `.helix/languages.toml` to your `~/.config/helix/languages.toml`.

### Other Editors

The `.luarc.json` file works with any LSP-compatible editor:
- **VSCode:** Install the "Lua" extension by sumneko
- **Neovim:** Use `nvim-lspconfig` with `lua_ls`
- **Sublime Text:** Install LSP-lua package
- **Any LSP client:** Point it to lua-language-server

## Building and Running

### Build and Run
```bash
./build.fish
```

This will:
1. Compile your Lua source files into a `.pdx` bundle
2. Create a symbolic link in the Playdate SDK's Games directory
3. Launch the Playdate Simulator with your game

### Build Only
```bash
$PLAYDATE_SDK_PATH/bin/pdc source .builds/Gutwound.pdx
```

### Run Only (after building)
```bash
$PLAYDATE_SDK_PATH/bin/PlaydateSimulator .builds/Gutwound.pdx
```

## Project Structure

```
Gutwound/
├── source/              # Lua source files
│   ├── main.lua        # Entry point (must have playdate.update())
│   └── pdxinfo         # Game metadata
├── .builds/            # Compiled .pdx bundles (gitignored)
├── .playdate-luacats/  # LuaCATS type definitions for Playdate SDK
├── .luarc.json         # lua-language-server configuration
├── .helix/             # Helix editor configuration
└── build.fish          # Build script
```

## Development Tips

### Playdate API Basics
- The Playdate uses Lua 5.4
- Import libraries with `import "CoreLibs/graphics"`
- Every game must have a `playdate.update()` function
- Playdate adds assignment operators: `+=`, `-=`, `*=`, `/=`, etc.
- Use `local pd <const> = playdate` for better performance

### Testing on Device
1. Build your game: `./build.fish`
2. Upload `.builds/Gutwound.pdx` to your Playdate device via USB
3. Use the Playdate's Data Disk mode or web interface

### Resources
- [Playdate SDK Documentation](https://sdk.play.date/)
- [Inside Playdate (SDK book)](https://sdk.play.date/Inside%20Playdate.html)
- [Playdate Developer Forums](https://devforum.play.date/)
- [Lua Language Server Annotations](https://luals.github.io/wiki/annotations/)

## License

See LICENSE file for details.


Gutwound is a survival game, that asks the question, how would you fair surviving in a twister turning towerblock in the apocalypse, while bleeding out from a Gutwound, and trying to get to the top to ascend before you die.

This was once a Picotron game, but after reviewing the existing codebase I have decided to do a rewrite and migrate over to Playdate.

I apologise to anyone hoping to get this working on a macOS, it will not work, or at least has not worked for me, due, linux just seems to work better for swift embedded development, who knew. 

### Pre-requisites

- PlaydateSDK
- Swift 6.2+
- Linux

### Build

`./build.fish`

