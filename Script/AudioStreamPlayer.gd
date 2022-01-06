extends AudioStreamPlayer

var global
func _ready():
	global = get_node("/root/Global")
	pass
	
func _process(delta):
	volume_db = global.volumeDb
	pass
