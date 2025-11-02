extends Node2D

var cursorPosition = 1
var StartedTimer = 0

@onready var CooldownTimer = get_node("Timers/InputCooldown")
@onready var CursorSprite = get_node("Graphics/Cursor")

func _process(_delta):
	if StartedTimer != 1:
		CooldownTimer.start()
		StartedTimer = 1

func _on_input_cooldown_timeout():
	CheckInput()
	TitleLogic()

func CheckInput():
	if Input.is_action_pressed("Left"):
		if cursorPosition != 1:
			cursorPosition -= 1
	
	if Input.is_action_pressed("Right"):
		if cursorPosition != 3:
			cursorPosition += 1

# TODO: add SFX to the buttons if possible
func TitleLogic():
	if cursorPosition == 1:
		CursorSprite.position = Vector2(168, 608)
		
		if Input.is_action_pressed("Confirm"):
			get_tree().change_scene_to_file("res://scenes/test.tscn")
			
	if cursorPosition == 2:
		CursorSprite.position = Vector2(454, 608)
		
		if Input.is_action_pressed("Confirm"):
			print("TODO: Implement this")
			
	if cursorPosition == 3:
		CursorSprite.position = Vector2(825, 608)
		
		if Input.is_action_pressed("Confirm"):
			get_tree().quit(0)
