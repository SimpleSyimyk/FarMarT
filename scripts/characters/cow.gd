extends Node2D

func _on_timer_timeout() -> void:
	$"../cow_animation".play("idle2")
	await $"../cow_animation".animation_finished
	$"../cow_animation".play("idle")
