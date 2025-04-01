extends CharacterBody2D
const SPEED : float = 80.0
func _ready() -> void:
	choice_direction()
func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.LEFT * SPEED * delta)
func choice_direction():
	var direction = ['left','right','up','down'].pick_random()
	add_to_group(direction)
	$arrow_sprite.play('arrow_' + direction)
