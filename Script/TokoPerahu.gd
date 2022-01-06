extends Control

var global
func _ready():
	global = get_node("/root/Global")
	$PerahuKano/Label2.text = String(global.boat.boats[7].harga)
	$PerahuJukung/Label2.text = String(global.boat.boats[6].harga)
	$PerahuDredger/Label2.text = String(global.boat.boats[5].harga)
	$PerahuRawal/Label2.text = String(global.boat.boats[4].harga)
	$PerahuPukaHela/Label2.text = String(global.boat.boats[3].harga)
	$KapalPancingJoran/Label2.text = String(global.boat.boats[2].harga)
	$KapalJaringInsang/Label2.text = String(global.boat.boats[1].harga)
	$KapalJaringAngkat/Label2.text = String(global.boat.boats[0].harga)

	pass

func _process(delta):
	var user = global.infoUser.infoGame
	for i in get_child_count():
		for j in user.boats.size():
			if(i == user.boats[j]):
				get_child(i).find_node("ColorRect2").visible = false
	pass
