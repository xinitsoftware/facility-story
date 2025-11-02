extends Node

signal NextStage

# RGB[0] = red, RGB[1] = green, RGB[2] = blue
var SpacingDuration = 0
var RGB = [1, 1, 1]
var energy_value = 0.5
var TimesFlickered = 0

@onready var SpacingTimer = $"../../Timers/SpacingTimer"
@onready var ControlTimer = $"../../Timers/ControlTimer"
@onready var MapLighting = $"../CanvasModulate"
@onready var LightList = [get_node("PointLight2D"), get_node("PointLight2D2"), get_node("PointLight2D3"), get_node("PointLight2D4"), get_node("PointLight2D5"), get_node("PointLight2D6"), get_node("PointLight2D7"), get_node("PointLight2D8")]


func _on_root_intro_scene():
	ControlTimer.start()
	ControlTimer.timeout.connect(FlickerControl)

func FlickerControl():
	if TimesFlickered != 5:
		Flicker()
		TimesFlickered += 1
	else:
		ControlTimer.stop()
		Flicker()
		NextStage.emit()

func Flicker():
	MapLighting.color = Color(0.1, 0.1, 0.1)
	energy_value = 0.2
	
	RGB[1] = 0.5
	RGB[2] = 0.5
	UpdateLighting()
	
	SpacingDuration = randf_range(0.25, 0.5)
	if TimesFlickered != 5:
		SpacingTimer.start(SpacingDuration)

func _on_spacing_timer_timeout():
	MapLighting.color = Color(0.5, 0.5, 0.5)
	energy_value = 0.5
	
	RGB[1] = 1
	RGB[2] = 1
	UpdateLighting()
	
func UpdateLighting():
	LightList[0].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[1].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[2].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[3].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[4].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[5].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[6].color = Color(RGB[0], RGB[1], RGB[2])
	LightList[7].color = Color(RGB[0], RGB[1], RGB[2])
	
	LightList[0].energy = energy_value
	LightList[1].energy = energy_value
	LightList[2].energy = energy_value
	LightList[3].energy = energy_value
	LightList[4].energy = energy_value
	LightList[5].energy = energy_value
	LightList[6].energy = energy_value
	LightList[7].energy = energy_value
