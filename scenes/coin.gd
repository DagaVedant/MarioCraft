extends Area2D
func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	get_tree().current_scene.collect_coin()
	queue_free()
