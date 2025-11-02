extends Camera2D

var randX = 0
var randY = 0
var TimesShaken = 0

@onready var CameraTimer = $"../../../Timers/CameraShakeTimer"

func NextStage():
	if TimesShaken != 500:
		randX = randf_range(-20, 20)
		randY = randf_range(-20, 20)
		self.offset = Vector2(randX, randY)
		CameraTimer.start(0.01)
	else:
		self.offset = Vector2(0, 0)

func CameraTimer_Timeout():
	NextStage()
	TimesShaken += 1
