extends CharacterBody2D

var speed = 30
@onready var rows = [
	$rows/row_sprite1,
	$rows/row_sprite2,
	$rows/row_sprite3,
	$rows/row_sprite4
]
var numbers = [
	"one", 
	"two", 
	"three", 
	"four"
]

func _ready() -> void:
	add_to_group('column')
	numbers.shuffle()
	for i in range(4):
		rows[i].play(numbers[i])

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.LEFT * speed * delta)

func check_number(x:int, y:int):
	var nums = {1:'one',2:'two',3:'three',4:'four'}
	if rows[y].animation == nums[x]:
		rows[y].play("no_animation")
		numbers[y] = 'none'
		return 1
	return 0
