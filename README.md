# Gutwound

A survival game for Playdate.

Gutwound is a survival game, that asks the question, how would you fair surviving in a twister turning towerblock in the apocalypse, while bleeding out from a Gutwound, and trying to get to the top to ascend before you die. The tower and items you find are loosely based on Kowloon Walled City before it was demolished during the early 90s.

The gameplay will go like this, you will start on a randomly generated but distinct floor. You will be bleeding out from a wound you sustained before the start of the game, the wound is in your gut, meaning you have time to live, and even longer if you get treatment. At the top of the tower is ascention, if you can arrive there before dying, you have a chance as ascending to the afterlife. To get to the top, you will search rooms, containing various household containers, find healing, food, water, clothes, protective items, medicine.

The game will take place over 4 levels, the first is a normal level, nothing super special happening there apart from a standard post apocalyptic apartment block.
The second level has lots of missing walls, exposing the floor to the elements outside. This floor is extremely cold, if the player has not found warm clothes or does not quickly find them or a place to warm up they will not survive the floor.
The third has high radiation, it is made up of labs where research must have been conducted, the experiments are long gone but the radioactive isotopes live on, you must find radiation protection to survive the floor.
The fourth floor you will confront your own sanity, the dark sections of the map outside of the rooms will show grotesque aparitions. Pools of blood will start to collect on the floor, and then your vision will start to diminish. You cannot sleep in this state so the final floor is the decider, if you've done enough you should make it through.

Undocking the crank will open the inventory, it is also the method for resewing your wound, as well as dissenfecting and bandaging.

You will need to eat, drink, sleep, and protect yourself. You will gain hunger, tiredness, thirst, delirium, pain, as well as your general health and your wound health taking individual damage. i.e. sprinting will increase damage to your wound.

Through the first and second level, a central corridor runs through, giving you the ability to skip ahead once you feel you have enough equipment to brave the upper floors.

Whenever you move you lose health, so rushing to the upperfloors is not advices.

The levels will be generated partially randomly from a set of pre configured room layouts. The rooms will be hand pixelled, i.e. we will not be working from a randomised tileset, but we will be using a tileset to generate.

Actual tile sizes or sprite sizes are yet to be defined but we will experiment with half pixel ration/12x12 as well as 48x48 at normal pixel ratio. This is to give enough room for the detail required. After some light testing changing the scaling isn't quite it. I think 48x48 is worth a try, and if not we will be sticking with 32x32. I really like the level of detail normal scaling provides, and considering the environment is essentially a main character we should make use of it.

Art style and movement will be loosely based on racheteer.

For sound I would like to use a synthesizer, possibly an analogue synth, we will see about getting one. I also really love the idea of just include ambient type music, similar to the sad soft cold playlists nobody produces.

This was once a Picotron game, but after reviewing the existing codebase I have decided to do a rewrite and migrate over to Playdate.

### Pre-requisites

- PlaydateSDK
- Swift 6.2+
- Linux

### Build

`./build.fish`

## File Structure

```
source/
├── main.lua                    # Entry point, game loop
├── game/
│   ├── game_state.lua         # Game state manager (menu, playing, inventory, etc.)
│   ├── stats.lua              # Player stats (health, wound, hunger, thirst, etc.)
│   └── conditions.lua         # Status effects (bleeding, cold, radiation, delirium)
├── character/
│   ├── player.lua             # Player sprite, movement, actions
│   └── animations.lua         # Player animation states
├── world/
│   ├── floor.lua              # Floor generation and management
│   ├── room.lua               # Room data structures
│   ├── generators/
│   │   ├── floor1_gen.lua    # Standard apocalyptic floor
│   │   ├── floor2_gen.lua    # Cold floor (missing walls)
│   │   ├── floor3_gen.lua    # Radiation floor (labs)
│   │   └── floor4_gen.lua    # Sanity floor (apparitions)
│   └── corridor.lua           # Central corridor system
├── items/
│   ├── item.lua              # Base item class
│   ├── inventory.lua         # Inventory management
│   ├── types/
│   │   ├── consumables.lua   # Food, water, medicine
│   │   ├── medical.lua       # Bandages, disinfectant, sutures
│   │   ├── clothing.lua      # Warm clothes, radiation suits
│   │   └── containers.lua    # Searchable containers
│   └── loot_tables.lua       # Item spawn probabilities
├── ui/
│   ├── hud.lua               # Health bars, stats display
│   ├── inventory_screen.lua  # Inventory UI (crank-activated)
│   ├── wound_care.lua        # Wound treatment UI (crank-based)
│   └── menu.lua              # Pause/main menu
├── systems/
│   ├── time.lua              # Game time, day/night cycles
│   ├── survival.lua          # Hunger, thirst, sleep systems
│   ├── damage.lua            # Damage calculations
│   └── effects/
│       ├── cold.lua          # Cold exposure effects
│       ├── radiation.lua     # Radiation damage
│       └── sanity.lua        # Delirium, apparitions, vision
├── util/
│   ├── math.lua              # Math helpers
│   ├── tables.lua            # Table utilities
│   └── random.lua            # Random generation utilities
└── assets/
    ├── sprites/              # Player, item sprites
    ├── rooms/                # Pre-made room images
    ├── tiles/                # Tileset assets
    └── effects/              # Visual effects (blood, apparitions)
```

