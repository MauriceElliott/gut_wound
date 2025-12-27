# Gut Wound: Picotron → Playdate Migration Plan

**Target Platform:** Playdate (400×240, 1-bit display)  
**Primary Language:** Lua  
**Performance Critical Code:** Swift (C ABI extern)  
**Editor:** Helix  
**Tooling:** VSCode Playdate extensions adapted for CLI workflow

## Phase Overview

```
Phase 0: Tooling & Workflow Setup
  └─> Phase 1: Single Room Proof-of-Concept
      └─> Phase 2: System Migration
          └─> Phase 3: Content & Map Rebuild
```

---

## Phase 0: Tooling & Workflow Setup

**Goal:** Establish a Helix-based CLI development pipeline for Playdate.

### 0.1 Environment Setup
- [x] Install Playdate SDK → `/home/maurice/PlaydateSDK`
- [x] Set `PLAYDATE_SDK_PATH` environment variable
- [x] Verify `pdc` (Playdate Compiler) works
- [x] Test Playdate Simulator

### 0.2 Build System
- [ ] Create `build.sh` script for compilation
  - Invoke `pdc` to compile Lua → `.pdx`
  - Handle incremental builds
  - Error reporting with line numbers
- [ ] Create `run.sh` to build + launch simulator
- [ ] Create `watch.sh` for hot-reload during development

### 0.3 Helix Integration
- [ ] Configure Helix language server for Lua (if available)
- [ ] Add custom commands to `.helix/languages.toml`:
  - Build: `:run-shell-command ./build.sh`
  - Run: `:run-shell-command ./run.sh`
  - Test: `:run-shell-command ./test.sh`
- [ ] Set up syntax highlighting for Playdate Lua APIs
- [ ] Configure diagnostics for common Playdate API errors

### 0.4 Asset Pipeline
- [ ] Script to convert PNG → 1-bit Playdate format
  - Use ImageMagick: `convert input.png -colorspace gray -threshold 50% output.png`
  - Handle sprite tables (grid-based sprite sheets)
- [ ] Tilemap conversion script (Tiled → Lua tables)
- [ ] Audio conversion (if needed)

### 0.5 Swift/C Integration (for later performance work)
- [ ] Research Playdate C API documentation
- [ ] Set up Swift build toolchain
- [ ] Create template for Swift → C ABI → Lua bridge
- [ ] Test minimal "Hello from Swift" example

**Deliverables:**
- Working CLI build/run pipeline
- Helix configured for efficient Playdate Lua development
- Asset conversion scripts ready

## Phase 1: Single Room Proof-of-Concept

**Goal:** Implement ONE room with player movement, collision, and rendering to validate the entire pipeline.

### 1.1 Project Structure
```
gutwound_playdate/
├── Source/
│   ├── main.lua              # Entry point
│   ├── config.lua            # Constants (GRID_SIZE, etc)
│   ├── systems/
│   │   ├── grid_movement.lua # Grid-based movement
│   │   └── room.lua          # Room rendering/logic
│   ├── entities/
│   │   └── player.lua        # Player entity
│   └── rooms/
│       └── test_room.lua     # Single test room data
├── images/
│   ├── player-table-16-16.png
│   └── tiles-table-16-16.png
├── build.sh
├── run.sh
└── pdxinfo                    # Game metadata
```

### 1.2 Sprite Migration
- [ ] Pick 1-2 character sprites from Picotron
- [ ] Convert to 1-bit (threshold dithering)
- [ ] Create Playdate sprite table (16×16 grid)
- [ ] Pick essential tiles (floor, wall, door)
- [ ] Convert to 1-bit tileset

### 1.3 Core Systems Implementation

**Grid Movement System**
- [ ] Implement grid-based movement (16×16 grid on 400×240 screen = 25×15 tiles)
- [ ] D-pad input handling
- [ ] Smooth interpolation between grid cells
- [ ] Collision detection against walls

**Room System**
- [ ] Define room data structure:
  ```lua
  {
    id = "test_room",
    width = 25,  -- tiles
    height = 15,
    layers = {
      floor = {...},   -- tile indices
      walls = {...},
      objects = {...}
    },
    collisionMap = {...},
    exits = {...}
  }
  ```
- [ ] Tilemap rendering using Playdate's tilemap API
- [ ] Layer compositing (floor → walls → player → objects)

**Player Entity**
- [ ] Basic player sprite
- [ ] Position tracking (grid coords)
- [ ] Direction facing
- [ ] Simple animation (if time permits)

### 1.4 Test Room Design
- [ ] Create a 25×15 tile room
- [ ] Add walls around perimeter
- [ ] Place player spawn point
- [ ] Test collision
- [ ] Add one exit/door (non-functional for now)

**Success Criteria:**
- Player moves on grid with D-pad
- Collides with walls
- Renders correctly in simulator
- Build/run workflow is smooth

## Phase 2: System Migration

**Goal:** Port core gameplay systems from Picotron to Playdate.

### 2.1 Inventory System
- [ ] Port inventory data structures
- [ ] Implement crank-based item selection
  - `playdate.getCrankTicks()` for cycling
  - Visual feedback for selected item
- [ ] Item use/drop/equip logic
- [ ] Container interaction (search, take items)

### 2.2 Vitals System
- [ ] Port health, hunger, thirst, pain, fatigue
- [ ] Passive degradation over time
- [ ] Resting/movement modifiers
- [ ] Bleeding mechanic

### 2.3 UI/HUD
- [ ] Vitals display (top/bottom bar)
- [ ] Moodles/status effects
- [ ] Inventory display (crank-driven)
- [ ] Context menu system (A/B buttons)
- [ ] 1-bit iconography for status

### 2.4 Interaction System
- [ ] Context-sensitive actions
- [ ] Doors (open, locked, jammed)
- [ ] Containers (search, loot)
- [ ] Fires (light, warm up, extinguish)
- [ ] Items (use, drop, equip)

### 2.5 Room Transitions
- [ ] Exit detection
- [ ] Room loading/unloading
- [ ] Player respawn at entry points
- [ ] Fog of war / discovery system (optional dithered overlay)

### 2.6 Save/Load System
- [ ] Playdate datastore API
- [ ] Save player state (position, vitals, inventory)
- [ ] Save room states (discovered, looted containers)
- [ ] Auto-save on room transition

**Deliverables:**
- All core systems functional
- 2-3 connected rooms as test case
- Playable vertical slice

## Phase 3: Content & Map Rebuild

**Goal:** Migrate/rebuild all game content and design the full map layout.

### 3.1 Asset Migration
- [ ] Convert ALL Picotron sprites → 1-bit
- [ ] Create comprehensive tile palette
- [ ] Port all item sprites
- [ ] Port character animations
- [ ] Convert/create audio assets (Caps or Audacity)

### 3.2 Content Port
- [ ] Items: Migrate from `sitems.lua`
- [ ] Containers: Migrate from `scontainers.lua`
- [ ] Loot tables: Migrate from `sloot.lua`
- [ ] Static objects: Fires, bloodstains, etc.

### 3.3 Map Design (FROM SCRATCH)
**This is where we reimagine the game for Playdate.**

- [ ] Design room-based map layout
  - Each room = one screen (no camera scrolling)
  - Hallways as separate room instances
  - Clear entry/exit points
- [ ] Create room templates:
  - Bedrooms
  - Kitchen
  - Bathroom
  - Hallways
  - Closets/storage
  - Exterior areas
- [ ] Build rooms in Tiled (or hand-code Lua tables)
- [ ] Define room connections and player spawn points
- [ ] Place containers, items, fires
- [ ] Balance loot distribution

### 3.4 Playdate-Specific Features
- [ ] Crank interactions:
  - Wind lighter
  - Open stuck doors (rotate crank)
  - Cycle inventory
  - "Warm hands" at fire
- [ ] 1-bit visual effects:
  - Screen shake for pain
  - Dithering for fog of war
  - Flashing for critical health
  - Inverted colors for special states
- [ ] Audio design:
  - Footsteps
  - Door sounds
  - Fire crackling
  - Pain/injury sounds
  - Ambient tension

### 3.5 Playtesting & Iteration
- [ ] Balance vitals decay rates
- [ ] Adjust difficulty (item scarcity)
- [ ] Refine room layout for pacing
- [ ] Polish UI/UX
- [ ] Optimize performance (target 30fps)

**Deliverables:**
- Complete playable game
- Full map with all rooms
- All items and interactions implemented
- Polished 1-bit aesthetic
- Efficient, stable build

## Swift/C Performance Layer (As Needed)

**When to use Swift:**
- Pathfinding (if added)
- Complex collision detection
- Procedural generation
- Heavy number crunching

**Integration Pattern:**
```swift
// Swift side
@_cdecl("fastCollisionCheck")
public func fastCollisionCheck(x: Int32, y: Int32) -> Bool {
    // Optimized collision logic
    return result
}
```

```lua
-- Lua side
import "CoreLibs/clibs"
local result = playdate.ext.fastCollisionCheck(x, y)
```

**Tasks:**
- [ ] Identify performance bottlenecks
- [ ] Implement critical functions in Swift
- [ ] Benchmark Lua vs Swift implementations
- [ ] Integrate via C ABI

## Success Metrics

**Phase 0:** Can build and run "Hello World" Playdate app from CLI with Helix
**Phase 1:** Player can walk around one room without bugs
**Phase 2:** All systems work in 2-3 room test map
**Phase 3:** Full game is playable and polished

## Reference Links

- [Playdate SDK Documentation](https://sdk.play.date)
- [Playdate Dev Forum](https://devforum.play.date)
- [Inside Playdate (API Reference)](https://sdk.play.date/inside-playdate)
