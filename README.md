# coin rush

a minecraft-looking obby where the game ends the second you grab your third coin.

**play it:** [itch.io link goes here once published](https://itch.io)
**code:** [github.com/DagaVedant/jumpstart_haven_game](https://github.com/DagaVedant/jumpstart_haven_game)

## what it does

you're steve. you run and jump across floating dirt platforms, hop over dripstone spikes, stay out of the lava, and pick up coins. red flags along the way are checkpoints. get the third coin and it's over.

## why

- every platformer i've played makes you collect *more* stuff to win. i wanted one where collecting is the thing that ends it, so you actually think about the last coin instead of just grabbing everything
- i wanted it to look like minecraft because i know exactly what those blocks are supposed to feel like to jump on

## how it works

```
spawn on the start ground
   -> run / jump between platforms (arrow keys or wasd, space to jump)
   -> touch a flag: it turns green, that's your new respawn point
   -> fall off, hit a spike, or step in lava
        -> teleport back to the last flag, coins kept
   -> touch a coin: counter goes up, coin disappears, ding
   -> third coin
        -> GAME OVER, game pauses, press space or r to play again
```

## controls

| action | keys |
|---|---|
| move | a / d or left / right |
| jump | space, w or up |
| play again (after game over) | space or r |

## running it locally

godot 4.7. open the folder in the editor and press f5, or from the project folder:

```
Godot_v4.7.2-stable_win64_console.exe --path .
```

no dependencies, no build step. tested: it runs clean with zero errors in the output panel.

## the project

| file | job |
|---|---|
| `main.tscn` / `main.gd` | the level, coin counter, checkpoints, game over, music |
| `scenes/player.tscn` + `.gd` | steve: movement, jump, camera |
| `scenes/coin.tscn` + `.gd` | pickup + sound |
| `scenes/dripstone.tscn`, `lava.tscn`, `kill_zone.tscn` + `.gd` | the three ways to die |
| `scenes/checkpoint.tscn` + `.gd` | the flags |
| `assets/` | textures, the soundtrack loop, jump and coin sfx |

every reusable thing is its own scene with its script sitting next to it, so changing `coin.tscn` changes every coin in the level.

## built with

godot 4.7 (mobile renderer), gdscript, one TileMapLayer for the ground, Area2D + `body_entered` signals for everything you can touch, AudioStreamPlayer nodes for sound.

made for [hack club jumpstart](https://jumpstart.hackclub.com), following the [2d godot platformer jam](https://jams.hackclub.com/jam/godot-platformer).
