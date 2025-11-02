extends Node2D

signal IntroScene

var times_flickered = 0
var IntroSequenceEnabled = false

@onready var timer = get_node("Timers/SetupTimer")

func _ready():
	if IntroSequenceEnabled == true:
		timer.start(1)
		timer.timeout.connect(emit)

func emit():
	IntroScene.emit()
