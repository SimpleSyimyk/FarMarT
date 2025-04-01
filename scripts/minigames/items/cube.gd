extends CharacterBody2D

const SPEED : float = 50.0

func _ready() -> void:
	add_to_group('cubes')

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.LEFT * SPEED * delta)
