# Tutorial Notes: Jumpstart 2D Godot Platformer

## Tutorial Overview
This is a Hack Club "Jumpstart" beginner tutorial covering:
- 0:00 Intro & Overview
- 0:37 Godot Setup & Layout  
- 2:18 Creating Player (Image & Collision)
- 4:41 Making Tileset Map
- 7:18 Creating Player Movement
- 9:49 Editing Player Movement Code
- 11:46 Adding Camera
- 12:37 Customizing Your Game
- 14:07 Creating & Updating Github Repo
- 16:21 Uploading to Itch.io
- 19:00 Submitting Your Game

## Current Project State
Your project is at the stage described in chapter 2:18 "Creating Player (Image & Collision)".
You have a Main node containing:
- A CharacterBody2D node
- A Sprite2D with icon.svg as texture
- A CollisionShape2D
No scripts have been added yet, and there's no gravity/flap code, pipes/obstacles, or coins.

## Reusable vs Platformer-Specific Elements
**Reusable for Flappy Bird:**
- Player setup (CharacterBody2D with sprite and collision)
- Collision detection via signals
- Camera follow functionality

**Platformer-Specific (NOT needed):**
- Tileset ground/running mechanics
- Ground-based movement controls
- Platform-specific physics

## New Concepts Needed for Flappy Bird Style Game
To build "flappy bird but game-over on 3rd coin collected", you'll need to implement:

1. Gravity physics for downward movement
2. Single flap/jump input (spacebar or tap)
3. Scrolling obstacles (or static platforms/hazards for obby-style game)
4. Coin spawning system
5. Collision detection using area_entered / body_entered signals
6. Score/coin counter UI
7. Game-over condition triggered by collecting 3 coins (not by dying)