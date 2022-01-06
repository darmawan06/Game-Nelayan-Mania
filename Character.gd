extends Sprite

var profile;
onready var boat_sprite = get_node(".")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func switch_texture_boat():
	profile = get_node("/root/Global")
	if(profile.infoUser.infoGame.idUseBoat == len(profile.infoUser.infoGame.boats)-1):
		profile.infoUser.infoGame.idUseBoat = 0
		pass
	else:
		profile.infoUser.infoGame.idUseBoat += 1
	var value = profile.boat.boats[profile.infoUser.infoGame.boats[profile.infoUser.infoGame.idUseBoat]];
	var texture = load(value.path)
	boat_sprite.set_texture(texture)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	switch_texture_boat()
	pass
	
func _process(delta):
	var root = find_parent("Root")
	var nodeControl = get_parent().find_node("Camera2D").find_node("Control")
	nodeControl.find_node("Text Coin").text = String(root.gold)
	nodeControl.find_node("Text Ikan").text = String(root.beratIkan) + "/ " + String(profile.infoUser.infoGame.level*100)
	if(Input.is_action_just_pressed("ChangeBoat")):
		switch_texture_boat()
	pass
