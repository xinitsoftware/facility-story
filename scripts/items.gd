extends Node

signal BarObtained
signal PSUObtained
signal KeycardObtained
signal CodeObtained

@onready var MetalBar = get_node("Metal Bar")
@onready var PSU = get_node("Power Supply")
@onready var Keycard = get_node("Keycard")
@onready var CodePaper = get_node("Code Paper")
@onready var PlayerChar = $"../../../Mobs/CharacterBody2D"

func _physics_process(_delta):
	if MetalBar.overlaps_body(PlayerChar) == true:
		if Input.is_action_pressed("Confirm"):
			BarObtained.emit()
	if PSU.overlaps_body(PlayerChar) == true:
		if Input.is_action_pressed("Confirm"):
			PSUObtained.emit()
	if Keycard.overlaps_body(PlayerChar) == true:
		if Input.is_action_pressed("Confirm"):
			KeycardObtained.emit()
	if CodePaper.overlaps_body(PlayerChar) == true:
		if Input.is_action_pressed("Confirm"):
			CodeObtained.emit()
