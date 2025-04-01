extends Node2D

var score : int = 0

func _ready() -> void:
	set_physics_process(false)

func _on_dafault_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('indicator'):
		score = 1
func _on_dafault_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('indicator'):
		score = 0
func _on_better_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('indicator'):
		score = 4
func _on_better_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('indicator'):
		score = 5
