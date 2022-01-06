extends Button
var Root

func _ready():
	Root = find_parent("Root")
	toggle_mode = true
	pass
	
func _toggled(button_pressed):
		Root.PauseMode = false
