# MarioCraft

A minecraft/mario style obby, where you have to run and jump past spikes and lava, collect three coins to win!!!

**play it:** [itch.io link](https://vedantdaga.itch.io/mariocraft)

## what it does

you're steve. you run and jump across floating dirt platforms, hop over dripstone spikes, stay out of the lava, and pick up coins. red flags along the way are checkpoints. get all the coins and YOU WINNNN

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

## the project

| file | job |
|---|---|
| `main.tscn` / `main.gd` | the level, coin counter, checkpoints, game over, music |
| `scenes/player.tscn` + `.gd` | steve: movement, jump, camera |
| `scenes/coin.tscn` + `.gd` | pickup + sound |
| `scenes/dripstone.tscn`, `lava.tscn`, `kill_zone.tscn` + `.gd` | the three ways to die |
| `scenes/checkpoint.tscn` + `.gd` | the flags |
| `assets/` | textures, the soundtrack |

## built with

godot 4.7 (mobile renderer)

made for [hack club jumpstart](https://jumpstart.hackclub.com), and used the [2d godot platformer jam](https://jams.hackclub.com/jam/godot-platformer).
