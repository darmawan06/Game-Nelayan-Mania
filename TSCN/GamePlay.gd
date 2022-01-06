extends Node2D
var rootMaps
var map
var gold
var beratIkan
var maxBeratIkan
var instance
var ikanikan
var PauseMode
var rank
var level = 0;
var global
var volumeDb = 50;
var Stop;
func _ready():
	gold = 0
	Stop = 0
	beratIkan = 0
	PauseMode = false
	global = get_node("/root/Global")
	level = global.infoUser.infoGame.level

	maxBeratIkan = level*100
	map = load(global.maps[global.mapSelected].path);
	instance = map.instance()
	add_child(instance,true)
	move_child(instance,0)
	$AudioStreamPlayer.volume_db = global.volumeDb
	pass

func inputPause():
	var pause = $"Player 1/KinematicBody2D/Camera2D/Pause"
	if Input.is_action_just_pressed("ui_cancel"):
		if(PauseMode):
			PauseMode = false
		else:
			PauseMode = true

	if(PauseMode):
		pause.visible = true
	else:
		pause.visible = false

		
func _process(delta):
	inputPause()
	ikanikan = get_node("ikan-ikan")
	if(ikanikan.get_child_count() == 0):
		var RewardGame = $"Player 1/KinematicBody2D/Camera2D/RewardGame"
		RewardGame.visible = true
		RewardGame.gold = gold
		RewardGame.kg = beratIkan
		RewardGame.rank = rank
		RewardGame.level = level
		if(Stop == 0):
			global.infoUser.infoGame.money += gold
			global.infoUser.infoGame.exp += (1000/rank) + beratIkan
			if(global.infoUser.infoGame.exp >= global.infoUser.infoGame.level*100):
				RewardGame.find_node("Panel").find_node("levelUp").visible = true
				global.infoUser.infoGame.level += 1;
				global.infoUser.infoGame.exp = 0;
				global.infoUser.infoGame.maximalIkan = global.infoUser.infoGame.level*100
			Stop = 1;
	pass
