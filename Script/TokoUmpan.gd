extends Control

var global
func _ready():
	global = get_node("/root/Global")
	$Weagen2/Label2.text = String(global.umpans.umpan[3].harga)
	$Oeam/Label2.text = String(global.umpans.umpan[2].harga)
	$Minnow/Label2.text = String(global.umpans.umpan[1].harga)
	$MermaidKnight/Label2.text = String(global.umpans.umpan[0].harga)

	pass

func _process(delta):
	var user = global.infoUser.infoGame 
	for i in get_child_count():
		for j in user.umpan.size():
			if(i == user.umpan[j]):
				get_child(i).find_node("ColorRect2").visible = false
	pass
