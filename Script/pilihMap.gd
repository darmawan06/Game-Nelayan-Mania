extends Button
export (int) var indexMapGlobal = 0
var global
func _ready():
	toggle_mode = true
	pass
	
func _toggled(button_pressed):
	if(button_pressed):
		global = get_node("/root/Global")
		global.mapSelected = indexMapGlobal
		var value = get_tree().change_scene("res://TSCN/GamePlay.tscn")
