extends Control
var global;

func _ready():
	global = get_node("/root/Global")
	$Panel/CheckBox.pressed = global.fullscreen
	OS.window_fullscreen = global.fullscreen
	$Panel/Label2/HScrollBar.value = global.volumeDb
	pass


func _process(delta):
	if($Panel/CheckBox.pressed):
		global.fullscreen = true
	elif(!$Panel/CheckBox.pressed):
		global.fullscreen = false
	OS.window_fullscreen = global.fullscreen
	global = get_node("/root/Global")
	global.volumeDb = $Panel/Label2/HScrollBar.value
	print(global.volumeDb)
	pass
