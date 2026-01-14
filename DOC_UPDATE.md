# Gutwound Design Document

## 1. Game Overview
**Title:** Gutwound  
**Platform:** Playdate  
**Language:** Swift (via PlaydateKit)  
**Genre:** Roguelike Survival  
**Setting:** Post-apocalyptic tower block (loosely inspired by Kowloon Walled City), ~1 year after the event.

## 2. Core Gameplay Loop
The player traverses up a 4-level tower block to reach "Ascension".
*   **Survival Mechanics:**
    *   **Hunger:** Must eat.
    *   **Sleep:** Must rest.
    *   **Temperature:** Stay warm (Levels 1-2) / Cool off (Level 3).
    *   **Sanity:** Manage mental state (Level 4 focus).
    *   **The Gutwound:** A gaping wound that must be regularly sewn up using the **Crank**.

## 3. Level Progression
1.  **Level 1: The Normal:** Residential flats, shops, remnants of the old world.
2.  **Level 2: The Broken:** Broken walls, exposure to elements. **Mechanic:** Cold/Hypothermia.
3.  **Level 3: The Radioactive:** Heavy radiation. **Mechanic:** Heat/Radiation burns.
4.  **Level 4: The Mind:** The final ascent. **Mechanic:** Sanity/Hallucinations.

## 4. Hardware Specifications
*   **Processor:** STM32F746 (ARM Cortex-M7) @ 168 MHz
*   **Screen:** 400 × 240 pixels (1-bit Monochrome, Memory LCD)
*   **Inputs:** D-Pad, A/B Buttons, Crank, Accelerometer
*   **FPS Target:** 30fps (Standard) or 50fps (Max).

## 5. Graphics & Display
### Resolution & Scaling
*   **Native Resolution:** 400x240 px.
*   **Display Scale:** 
    *   The Playdate SDK (and PlaydateKit) allows you to set a global **Display Scale**.
    *   **API:** `playdate.display.setScale(s)`
    *   **Function:** Setting scale to **2x** effectively turns the logical resolution into **200x120**. The device handles the upscaling automatically and efficiently.
    *   **Benefit:** This is how games like *Ratcheteer* achieve a chunky, retro look without manually drawing giant sprites. You draw at 16x16, and the device renders it as 32x32.

### Tile Configuration (Decision: 32x32)
Based on readability tests:
*   **Grid Size:** 32x32 pixels.
    *   **Map Size:** Approx 12 x 7.5 tiles visible on screen.
*   **Door Size:** 1x2 tiles (32px wide x 64px tall).
    *   *Reasoning:* 1x1 (32px) is too short for a door relative to a character. 1x2 provides good verticality.
*   **Character Size:** Likely ~24-32px tall.

## 6. Technical Implementation
*   **Library:** [PlaydateKit](https://github.com/finnvoor/PlaydateKit)
*   **Documentation:** [PlaydateKit Docs](https://finnvoor.github.io/PlaydateKit/documentation/playdatekit/)

### Project Structure
```
Sources/
  ├── Game/
  │   ├── Systems/         # Logic that runs every frame (Hunger, Input, Rendering)
  │   ├── Entities/        # Data objects (Player, NPC, Loot)
  │   └── Components/      # Modular traits (HealthComponent, InventoryComponent)
  ├── Levels/              # Map data and generation algorithms
  │   ├── Level1.swift
  │   └── ...
  ├── UI/                  # HUD, Menus, Crank Indicators
  └── Main.swift           # Entry point
```

## 7. Development Roadmap
1.  **Phase 1:** Basic movement + Map rendering (32x32 grid).
2.  **Phase 2:** The "Gutwound" crank mechanic + UI.
3.  **Phase 3:** Survival stats (Hunger/Temp) + Turn-based loop.
4.  **Phase 4:** Content creation (Levels 1-4).

