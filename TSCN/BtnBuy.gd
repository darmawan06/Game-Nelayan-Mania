extends Button
export (int) var id;
export (bool) var forBoat = true
func _ready():
	
	pass
	
func _process(delta):
	var global = get_node("/root/Global")
	var user = global.infoUser.infoGame;
	var boatsInShop = global.boat.boats
	var umpanInShop = global.umpans.umpan

	if(forBoat):
		if(pressed && user.money >= boatsInShop[id].harga):
			user.boats.append(id)
			user.money -= boatsInShop[id].harga
			pass
		pass
	else:
		if(pressed):
			if(pressed && user.money >= umpanInShop[id].harga):
				user.umpan.append(id)
				user.money -= umpanInShop[id].harga
		
			pass
		pass
	pass
