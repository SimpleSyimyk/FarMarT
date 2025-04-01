extends Node2D

@onready var parent_node = get_parent()
@onready var indicators = [
	$indicators/indicator1,
	$indicators/indicator2,
	$indicators/indicator3,
	$indicators/indicator4
]
@onready var areas = [
	$fix_areas/fix_area1,
	$fix_areas/fix_area2,
	$fix_areas/fix_area3,
	$fix_areas/fix_area4
]
var index = 0
@onready var current_indicator = indicators[index]
@onready var current_area = areas[index]
var score : int = 0
var health = 3

func _ready() -> void:
	current_indicator.moving(true)
	for i in range(4):
		var area = areas[i]
		var random_position = randi_range(0, 145)
		area.position = Vector2(random_position, i * 16)

func _process(_delta: float) -> void: 
	if Input.is_action_just_pressed("ui_accept"):
		check_scores()
	if Input.is_action_just_pressed("ui_cancel"):
		parent_node.close_minigame()

func _on_direction_change_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('indicator'):
		body.change_direction()


func check_scores():
	if current_area.score > 0:
		current_indicator.moving(false)
		score += current_area.score
		if score > 3:
			print('win')
			parent_node.close_minigame()
			return
		index += 1
		current_indicator = indicators[index]
		current_area = areas[index]
		current_indicator.moving(true)
	else: 
		health -= 1
