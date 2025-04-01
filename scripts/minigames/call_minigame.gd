#extends Node2D
#
#@onready var columns = [
	#$integer_columns/integer_column1,
	#$integer_columns/integer_column2,
	#$integer_columns/integer_column3,
	#$integer_columns/integer_column4,
	#$integer_columns/integer_column5
#]
#@onready var parent_node = get_parent()
#var score = 0
#var health = 3
#var column_index = 0
#var row_index = 0
#
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed('ui_cancel'):
		#get_tree().quit()
#
#func _on_kill_zone_body_entered(body: Node2D) -> void:
	#if body.is_in_group('column'):
		#column_index += 1
		#for i in range(4):
			#if not body.rows[i].animation == 'no_animaton':
				#health -= 1
				#if health < 1:
					#parent_node.close_mini_game()
		#body.queue_free()
#
#
#
#














extends Node2D

const BUTTON_SCENE_PATH = "res://scens/minigames/items/buttons.tscn"
const GRID_ROWS = 4
const GRID_COLS = 4

func _ready():
	print('ready')
	for row in range(GRID_ROWS):
		for col in range(GRID_COLS):
			
			var button_scene = load(BUTTON_SCENE_PATH)
			var button = button_scene.instantiate()
			var button_size = Vector2(16, 16)  # Замените на фактический размер кнопки
			button.position = Vector2(col * button_size.x, row * button_size.y)

			# Подключаем сигнал "pressed" с передачей row и col
			button.connect("pressed", Callable(self, "_on_button_pressed").bind(row, col))
			add_child(button)
			var result = button.connect("pressed", _on_button_pressed.bind(row, col))
			print("Сигнал подключен?", result)  # Должно быть 0 (OK) 
			# Устанавливаем row и col для кнопки
			button.set_meta("row", row)
			button.set_meta("col", col)

func _on_button_pressed(row, col):
	print("Нажата кнопка")
	print("Нажата кнопка в позиции: ряд =", row + 1, ", столбец =", col + 1)
	my_function(row, col)

func my_function(row, col):
	print("Вызвана my_function с координатами: ряд =", row + 1, ", столбец =", col + 1)
