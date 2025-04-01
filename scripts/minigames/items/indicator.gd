extends CharacterBody2D

var speed = 100
var direction = 1

func _ready() -> void:
	add_to_group('indicator')
	moving(false)

func _physics_process(_delta: float) -> void:
	velocity.x = direction * speed
	move_and_slide()

func change_direction():
	direction *= -1

func moving(flag):
	set_physics_process(flag)
