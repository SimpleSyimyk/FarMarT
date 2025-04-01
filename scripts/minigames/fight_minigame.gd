extends Node2D

const CUBE = preload("res://scens/minigames/items/cube.tscn")
@onready var poses = [
	$lines/position1.position,
	$lines/position2.position,
	$lines/position3.position,
	$lines/position4.position
]
@onready var lines = $lines
@onready var parent_node = get_parent()
var bodies = [null, null, null, null]
var score = 0
var health = 3


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		parent_node.close_minigame()
	elif Input.is_action_just_pressed('1'):
		if bodies[0] != null:
			bodies[0].queue_free()
			score += 1
		else:
			health -= 1
	elif Input.is_action_just_pressed('2'):
		if bodies[1] != null:
			bodies[1].queue_free()
			score += 1
		else:
			health -= 1
	elif Input.is_action_just_pressed('3'):
		if bodies[2] != null:
			bodies[2].queue_free()
			score += 1
		else:
			health -= 1
	elif Input.is_action_just_pressed('4'):
		if bodies[3] != null:
			bodies[3].queue_free()
			score += 1
		else:
			health -= 1
	if score == 10:
		parent_node.close_minigame()
	if health < 1:
		parent_node.close_minigame()

func _on_timer_timeout() -> void:
	var cube = CUBE.instantiate()
	var pos = poses.pick_random()
	cube.global_position = global_position + pos
	lines.add_child(cube)
func _on_deathline_body_entered(body: Node2D) -> void:
	health -= 1
	body.queue_free()
	
func _on_area_1_body_entered(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[0] = body
func _on_area_1_body_exited(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[0] = null
func _on_area_2_body_entered(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[1] = body
func _on_area_2_body_exited(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[1] = null
func _on_area_3_body_entered(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[2] = body
func _on_area_3_body_exited(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[2] = null
func _on_area_4_body_entered(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[3] = body
func _on_area_4_body_exited(body: Node2D) -> void:
	if body.is_in_group('cubes'): 
		bodies[3] = null
