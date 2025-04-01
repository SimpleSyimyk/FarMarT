extends Node2D

@onready var mini_game_window = $CanvasLayer/Popup
@onready var fight_mini_game_scene = "res://scens/minigames/fight_minigame.tscn"
@onready var boss_fight_mini_game_scene = "res://scens/minigames/boss_fight_minigame.tscn"
@onready var fix_minigame = 'res://scens/minigames/fix_minigame.tscn'
var mini_game_instance

func _ready() -> void:
	mini_game_window.transient = true 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		open_minigame(fix_minigame)
	elif Input.is_action_just_pressed("2"):
		open_minigame(fight_mini_game_scene)
	elif Input.is_action_just_pressed("3"):
		open_minigame(boss_fight_mini_game_scene)
	#elif Input.is_action_just_pressed("4"):
		#open_minigame(fix_minigame)
	


func open_minigame(mini_game_path):
	process_status(get_tree().current_scene, false)
	var mini_game_scene = load(mini_game_path)
	mini_game_instance = mini_game_scene.instantiate()
	mini_game_window.add_child(mini_game_instance)
	mini_game_window.popup_centered()
	mini_game_instance.set('parent_node', self)
	
func close_minigame():
	mini_game_window.hide()
	mini_game_instance.queue_free()
	set_physics_process(true)
	set_process(true)
	process_status(get_tree().current_scene, true)
	
func process_status(scene, flag):
	scene.set_physics_process(flag)
	scene.set_process(flag)
	scene.set_process_input(flag)
	if scene.get_children().size() == 0:
		return
	for child in scene.get_children():
		process_status(child, flag)
