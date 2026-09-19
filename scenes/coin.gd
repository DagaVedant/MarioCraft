extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	get_tree().current_scene.collect_coin()
	# The coin is about to be freed, which would cut the sound off. Hand the
	# player node to the scene, let it play, and free it when it finishes.
	var sfx: AudioStreamPlayer = $CoinSound
	remove_child(sfx)
	get_tree().current_scene.add_child(sfx)
	sfx.finished.connect(sfx.queue_free)
	sfx.play()
	queue_free()
