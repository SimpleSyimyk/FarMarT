extends CharacterBody2D

@export var speed : int = 5000

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	var direction : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		$player_animation.play("player_walk")
		$player_animation.flip_h = Input.is_action_pressed('ui_right')
		velocity = direction * speed * delta
		move_and_slide()
	else:
		$player_animation.play("player_idle")
		
	
	
