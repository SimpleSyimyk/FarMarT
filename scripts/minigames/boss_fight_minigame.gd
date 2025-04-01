extends Node2D

@onready var arrow_ground = $arrow_group
@onready var parent_node = get_parent()
@onready var positions = [
	$positions/pos1.position, 
	$positions/pos2.position, 
	$positions/pos3.position, 
	$positions/pos4.position
]
var directions = ['left', 'right', 'up', 'down']
const ARROW = preload("res://scens/minigames/items/arrow.tscn")

var health = 3
var score = 0
var bodies = []


func _process(_delta: float) -> void: 
	if Input.is_action_just_pressed('ui_cancel'):
		parent_node.close_minigame()
	if health < 1: parent_node.close_minigame()
	if score > 9: parent_node.close_minigame()
	check_and_delete_body()

func check_and_delete_body():
	for direction_index in range(4):
		var direction = directions[direction_index]
		if Input.is_action_just_pressed('ui_' + direction):
			for index in range(bodies.size()):
				var body = bodies[index]
				print(index)
				if body != null and body.is_in_group(direction):
					score += 1
					if score > 9: parent_node.close_minigame()
					body.queue_free()
					return
			health -= 1

func _on_timer_timeout() -> void:
	var arrow = ARROW.instantiate()
	var arrow_position = positions.pick_random()
	arrow.global_position = global_position + arrow_position
	arrow_ground.add_child(arrow)

func _on_deth_area_body_entered(body: Node2D) -> void:
	for index in range(4):
		if body.is_in_group(directions[index]):
			body.queue_free()
			health -= 1
			break

func _on_press_area_body_entered(body: Node2D) -> void:
	for index in range(4):
		if body.is_in_group(directions[index]):
			bodies.push_back(body)
