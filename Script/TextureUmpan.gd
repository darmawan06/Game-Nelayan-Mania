extends Sprite

var profile;
onready var sprite = get_node(".")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func switch_texture():
	profile = get_node("/root/Global")
	if(profile.infoUser.infoGame.idUseUmpan == len(profile.infoUser.infoGame.umpan)-1):
		profile.infoUser.infoGame.idUseUmpan = 0
		pass
	else:
		profile.infoUser.infoGame.idUseUmpan += 1
	var value = profile.umpans.umpan[profile.infoUser.infoGame.umpan[profile.infoUser.infoGame.idUseUmpan]];
	var texture = load(value.path)
	get_child(0).text = String(value.name)
	sprite.set_texture(texture)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	switch_texture()
	pass
	
func _process(delta):
	profile = get_node("/root/Global")
	if(Input.is_action_just_pressed("ChangeUmpan")):
		switch_texture()
	pass
