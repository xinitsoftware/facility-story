extends Node

signal HorizontalOverlapping
signal VerticalOverlapping
signal JunctionOverlapping
signal ResetMode

@onready var HorizontalArea = get_node("Horizontal Crawling")
@onready var VerticalArea = get_node("Vertical Crawling")
@onready var JunctionArea = get_node("Junction Points")
@onready var MainArea = get_node("Main Area")
@onready var PlayerChar = $"../../../Mobs/CharacterBody2D"

func _physics_process(_delta):
	if HorizontalArea.overlaps_body(PlayerChar) == true:
		HorizontalOverlapping.emit()
	if VerticalArea.overlaps_body(PlayerChar) == true:
		VerticalOverlapping.emit()
	if JunctionArea.overlaps_body(PlayerChar) == true:
		JunctionOverlapping.emit()
	if MainArea.overlaps_body(PlayerChar) == true:
		ResetMode.emit()
