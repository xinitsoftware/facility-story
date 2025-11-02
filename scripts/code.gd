# scrapping this whole idea. who's gonna take the time to decode the morse code?
# better to convey this in-game instead
# though if someone takes the time to decompile this game then they deserve it

extends Sprite2D
@onready var AudioPlayer = get_node("AudioStreamPlayer2D")
@onready var Countdown = get_node("Timer")

func _ready():
	DisplayServer.window_set_title("Message")
	$AudioStreamPlayer2D.stream = AudioStreamWAV.load_from_file("res://resources/sounds/code.wav")
	$AudioStreamPlayer2D.play()
	startcountdown()

func startcountdown():
	$Timer.start(170)
	$Timer.timeout.connect(closegame)

func closegame():
	get_tree().quit(0)
