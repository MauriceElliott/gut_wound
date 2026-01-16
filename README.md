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

Actual tile sizes or sprite sizes are yet to be defined but we will experiment with half pixel ration/12x12 as well as 48x48 at normal pixel ratio. This is to give enough room for the detail required.

Art style and movement will be loosely based on racheteer.

For sound I would like to use a synthesizer, possibly an analogue synth, we will see about getting one. I also really love the idea of just include ambient type music, similar to the sad soft cold playlists nobody produces.

This was once a Picotron game, but after reviewing the existing codebase I have decided to do a rewrite and migrate over to Playdate.

### Pre-requisites

- PlaydateSDK
- Swift 6.2+
- Linux

### Build

`./build.fish`

