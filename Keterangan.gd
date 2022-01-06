extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
export var targetTime = 100
var music
# Called when the node enters the scene tree for the first time.
func _ready():
	music = $Music
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if(visible == true && time >= targetTime):
		hide()
	elif(visible == true && time <= targetTime):
		time+=1
	if(visible == true && time <= 1):
		music.play()
	elif(visible == true && time >= 10):
		music.stop()
	if(visible == false):
		time = 0
	pass
