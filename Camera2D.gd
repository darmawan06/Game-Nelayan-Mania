extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ZoomIn")):
		if(zoom.x < 2):
			zoom.x += 0.2
			zoom.y += 0.2
			scale.x += 0.2
			scale.y += 0.2

	elif(Input.is_action_just_pressed("ZoomOut")):
		if(zoom.x > 1):
			zoom.x -= 0.2
			zoom.y -= 0.2
			scale.x -= 0.2
			scale.y -= 0.2
		
	pass
