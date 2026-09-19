extends Node

const COINS_TO_END := 3

var coins_collected := 0
var is_game_over := false
var checkpoint := Vector2.ZERO

@onready var coin_label: Label = $UI/CoinLabel
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	checkpoint = player.global_position
	_update_label()
	_fit_camera_to_map()
	_start_music()


# Loop the soundtrack. Done in code so it works no matter what the .wav
# import settings say.
func _start_music() -> void:
	var music: AudioStreamPlayer = $Music
	if music.stream is AudioStreamWAV:
		music.stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
	music.finished.connect(music.play)
	if not music.playing:
		music.play()


# Camera limits follow whatever tiles exist, so painting more level to the
# right (or left) just works without touching player.tscn.
func _fit_camera_to_map() -> void:
	var used: Rect2i = $TileMapLayer.get_used_rect()
	var tile: int = $TileMapLayer.tile_set.tile_size.x
	var cam: Camera2D = $Player/Camera2D
	cam.limit_left = used.position.x * tile
	cam.limit_right = used.end.x * tile + 64

func collect_coin() -> void:
	if is_game_over:
		return
	coins_collected += 1
	_update_label()
	if coins_collected >= COINS_TO_END:
		game_over()

func set_checkpoint(pos: Vector2) -> void:
	checkpoint = pos

func player_died() -> void:
	if is_game_over:
		return
	player.velocity = Vector2.ZERO
	player.global_position = checkpoint + Vector2(0, -24)

func game_over() -> void:
	is_game_over = true
	coin_label.text = "GAME OVER - you got all %d coins!\nPress Space or R to play again" % COINS_TO_END
	get_tree().paused = true

func restart_level() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene.call_deferred()

func _unhandled_input(event: InputEvent) -> void:
	if not is_game_over:
		return
	if event.is_action_pressed("jump") or (event is InputEventKey and event.pressed and event.keycode == KEY_R):
		restart_level()

func _update_label() -> void:
	coin_label.text = "Coins: %d/%d" % [coins_collected, COINS_TO_END]
