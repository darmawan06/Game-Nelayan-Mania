extends Button

func _ready():
	toggle_mode = true
	pass
	
func _toggled(button_pressed):
	if(button_pressed):
		get_tree().change_scene("res://TSCN/Menu_Pilih_Map.tscn")
