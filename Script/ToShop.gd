extends Button
export (String) var linkPath;
func _ready():
	toggle_mode = true
	pass
	
func _toggled(button_pressed):
	if(button_pressed):
		get_tree().change_scene(linkPath)
