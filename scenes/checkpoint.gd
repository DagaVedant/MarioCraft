extends Area2D

@export var active_texture: Texture2D

var activated := false

func _on_body_entered(body: Node2D) -> void:
	if activated or not body.is_in_group("player"):
		return
	activated = true
	$Sprite2D.texture = active_texture
	get_tree().current_scene.set_checkpoint(global_position)
