extends CharacterBody2D

signal DeleteBar
signal DeleteCode
signal DeleteCard

# Inventory ID 0 - Metal Bar
# Invetory ID 1 - Crowbar
# Inventory ID 2 - Power Supply
# Inventory ID 3 - Keycard
# Inventory ID 4 - Code Paper

var MovementEnabled = true
var mode = 0
var input_direction = 0
var inventory = [0, 0, 0, 0, 0]
var ConvertedVector = 0
var InputFloat = 0

@export var speed = 100
@onready var _animated_sprite = $AnimatedSprite2D

func HorizontalOverlapping():
	mode = 1
func VerticalOverlapping():
	mode = 2
func JunctionOverlapping():
	mode = 3
func ResetMode():
	mode = 0

func BarObtained():
	inventory[0] = 1
	DeleteBar.emit()
	print(inventory)
	
func PSUObtained():
	inventory[2] = 1
	print(inventory)
	
func KeycardObtained():
	inventory[3] = 1
	DeleteCard.emit()
	print(inventory)
	
func CodeObtained():
	inventory[4] = 1
	DeleteCode.emit()
	print(inventory)
	
func animation():
	if Input.get_vector("Left", "Right", "Up", "Down"):
		_animated_sprite.play("default")
	else:
		_animated_sprite.stop()

func get_input():
	if mode == 0 or 3:
		input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	if mode == 1:
		input_direction = Input.get_axis("Left", "Right")
		InputFloat = input_direction
		
		ConvertedVector = Vector2(InputFloat, 0)
		input_direction = ConvertedVector
	if mode == 2:
		input_direction = Input.get_axis("Up", "Down")
		InputFloat = input_direction
		
		ConvertedVector = Vector2(0, InputFloat)
		input_direction = ConvertedVector
	velocity = input_direction * speed

func _physics_process(_delta):
	if MovementEnabled == true:
		get_input()
		animation()
		move_and_slide()
