extends Button


func _ready():
	toggle_mode = true;
	pass
	
func _toggled(button_pressed):
	get_tree().quit()
	pass
