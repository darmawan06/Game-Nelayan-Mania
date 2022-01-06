extends KinematicBody2D
var idleCharachter = preload("res://Karakter/iidle.png")
var fishingCharachter = preload("res://Karakter/mancing.png")
var Allfish = Array()
export (String) var nameuser = "Dikdik D";

var action =  false
var processFishing = false
var target_value = null
var foundFish = null
export (int) var maximalRandom = 0
export (int) var speed = 0
var stepFishing = 1
var speedInput = 0;
onready var profile
var rng = RandomNumberGenerator.new()
var inputFishing = Array()
var velocity = Vector2()
var Root;
# Called when the node enters the scene tree for the first time.
func _ready():
	Root = find_parent("Root")
	profile = get_node("/root/Global")
	pass
	
func get_moving():
	velocity = Vector2()
	if(Input.is_action_pressed("ui_right")):
		velocity.x += 1
		$Character.flip_h = true;
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= 1
		$Character.flip_h = false;
	if(Input.is_action_pressed("ui_down")):
		velocity.y += 1
	if(Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	velocity = velocity.normalized()*speed


func get_action():
	if(Input.is_action_just_pressed("fishing")):
		var myKordinat = find_parent("Root").position + position + get_parent().position
		foundFish = checkFish(myKordinat.x,myKordinat.y)
		if(foundFish != null):
			$Camera2D/Label.text = nameuser + " - Sedang Menyiapkan Peralatan"
			$Camera2D/Control/Karakter.set_texture(fishingCharachter)
			$Camera2D/Control/PanelActionFishing.hide()
			rng.randomize()
			target_value = rng.randi_range(0,maximalRandom)
			action = true;
			processFishing = false;
		else:
			$Camera2D/Control/Keterangan.hide()
			$Camera2D/Label.text = nameuser + " - Upss, Tidak ada ikan disini !"

	if(Input.is_action_just_pressed("cancel_fishing")):
		if(foundFish != null):
			$Camera2D/Control/Karakter.set_texture(idleCharachter)
			$Camera2D/Control/PanelActionFishing.hide()
			$Camera2D/Control/Keterangan.hide()
			$Camera2D/Label.text = nameuser + " - Memancing Di Batalkan :O"
			foundFish.find_node("Move").play = true
			foundFish = null
			action = false;
			processFishing = false;			
	pass
	
func checkFish(var xPlayer,var yPlayer):
	var nodeFish = find_parent("Root").find_node("ikan-ikan")
	var i = 0
	var nFish = nodeFish.get_child_count()
	print(nFish)
	while i < nFish:
		if(nodeFish != null):
			var rumusKordinat= nodeFish.get_child(i).find_node("Move").position + nodeFish.get_child(i).position
			var checkX = xPlayer - rumusKordinat.x
			var checkY = yPlayer - rumusKordinat.y
			if((checkX > -200 && checkX < 200) && checkY > -200 && checkY < 200):
				nodeFish.get_child(i).find_node("Move").play = false
				return nodeFish.get_child(i)
			i+=1
	pass
func showInputFishing(var inputsFishing):
	var right = preload("res://UI/arah/right.png")
	var top = preload("res://UI/arah/top.png")
	var down = preload("res://UI/arah/down.png")
	var left = preload("res://UI/arah/left.png")

	if(inputsFishing[0] == 1):
		$"Camera2D/Control/PanelActionFishing/Panel/Sprite0".set_texture(top)
	elif(inputFishing[0] == 2):
		$"Camera2D/Control/PanelActionFishing/Panel/Sprite0".set_texture(down)
	elif(inputFishing[0] == 3):
		$"Camera2D/Control/PanelActionFishing/Panel/Sprite0".set_texture(left)
	elif(inputFishing[0] == 4):
		$"Camera2D/Control/PanelActionFishing/Panel/Sprite0".set_texture(right)

	if(inputsFishing[1] == 1):
		$"Camera2D/Control/PanelActionFishing/Panel2/Sprite0".set_texture(top)
	elif(inputFishing[1] == 2):
		$"Camera2D/Control/PanelActionFishing/Panel2/Sprite0".set_texture(down)
	elif(inputFishing[1] == 3):
		$"Camera2D/Control/PanelActionFishing/Panel2/Sprite0".set_texture(left)
	elif(inputFishing[1] == 4):
		$"Camera2D/Control/PanelActionFishing/Panel2/Sprite0".set_texture(right)

	if(inputsFishing[2] == 1):
		$"Camera2D/Control/PanelActionFishing/Panel3/Sprite0".set_texture(top)
	elif(inputFishing[2] == 2):
		$"Camera2D/Control/PanelActionFishing/Panel3/Sprite0".set_texture(down)
	elif(inputFishing[2] == 3):
		$"Camera2D/Control/PanelActionFishing/Panel3/Sprite0".set_texture(left)
	elif(inputFishing[2] == 4):
		$"Camera2D/Control/PanelActionFishing/Panel3/Sprite0".set_texture(right)
		
	if(inputsFishing[3] == 1):
		$"Camera2D/Control/PanelActionFishing/Panel4/Sprite0".set_texture(top)
	elif(inputFishing[3] == 2):
		$"Camera2D/Control/PanelActionFishing/Panel4/Sprite0".set_texture(down)
	elif(inputFishing[3] == 3):
		$"Camera2D/Control/PanelActionFishing/Panel4/Sprite0".set_texture(left)
	elif(inputFishing[3] == 4):
		$"Camera2D/Control/PanelActionFishing/Panel4/Sprite0".set_texture(right)
		
	if(inputsFishing[4] == 1):
		$"Camera2D/Control/PanelActionFishing/Panel5/Sprite0".set_texture(top)
	elif(inputFishing[4] == 2):
		$"Camera2D/Control/PanelActionFishing/Panel5/Sprite0".set_texture(down)
	elif(inputFishing[4] == 3):
		$"Camera2D/Control/PanelActionFishing/Panel5/Sprite0".set_texture(left)
	elif(inputFishing[4] == 4):
		$"Camera2D/Control/PanelActionFishing/Panel5/Sprite0".set_texture(right)
	pass
func processBonus():
	var bonus = 0
	speedInput += 1;
	if(speedInput <= 30):
		bonus = foundFish.find_node("Move").bonusCoin[0]
	elif(speedInput <= 50):
		bonus = foundFish.find_node("Move").bonusCoin[1]
	else:
		bonus = foundFish.find_node("Move").bonusCoin[2]
	return bonus
	pass
func processPlayFishing():
	if(action == true && !is_instance_valid(foundFish)):
		action = false
		processFishing = false
		foundFish = null
		$Camera2D/Label.text = nameuser + " - Ikan di ambil orang lain :)"
		$Camera2D/Control/PanelActionFishing.hide()
	if(action == true):
		rng.randomize()
		var random_value = rng.randi_range(0,maximalRandom)
		if(target_value >= random_value && target_value <= random_value+10 && processFishing != true):
			speedInput = 0
			inputFishing = Array()
			var i = 0
			while i < 5:
				inputFishing.append(rng.randi_range(1,4))
				i+=1
				pass
			$Camera2D/Control/PanelActionFishing.show()
			processFishing = true
			showInputFishing(inputFishing)

			stepFishing = 0;
			
		if(processFishing == true):
			var press = 0
			var bonus = processBonus()
			$Camera2D/Label.text = nameuser + " - AYO!!, Tarikkk "
			if(Input.is_action_just_pressed("ui_up")):
				press = 1
			elif(Input.is_action_just_pressed("ui_down")):
				press = 2
			elif(Input.is_action_just_pressed("ui_left")):
				press = 3
			elif(Input.is_action_just_pressed("ui_right")):
				press = 4
			if(inputFishing[stepFishing] == press):
				stepFishing+=1
				if(stepFishing == 5):
					var getValueUmpan = profile.umpans.umpan[profile.infoUser.infoGame.umpan[profile.infoUser.infoGame.idUseUmpan]]
					action = false
					processFishing = false
					var beratIkan = foundFish.find_node("Move").beratSemuaIkan
					if(inputToProfile(bonus,getValueUmpan.bonus,beratIkan)):
						$Camera2D/Label.text = nameuser + " - Yey!! Dapat Ikan "
						foundFish.queue_free()
						$Camera2D/Control/PanelActionFishing.hide()
						$Camera2D/Control/Karakter.set_texture(idleCharachter)
						$Camera2D/Control/Keterangan.show()
						$Camera2D/Control/Keterangan/Label2.text = String(bonus) + " Gold + " + String(getValueUmpan.bonus) + "%"
						$Camera2D/Control/Keterangan/Label3.text = String(beratIkan) + " KG"
						$Camera2D/Control/Keterangan/Label4.text = "Input Speed = "+String(speedInput*0.01)+"/sec"
					else:
						$Camera2D/Label.text = nameuser + " - Storage Penuh !"
						$Camera2D/Control/PanelActionFishing.hide()
						foundFish.find_node("Move").play = true
					foundFish = null
					pass
			elif(press != 0 && inputFishing[stepFishing] != press):
				action = false
				processFishing = false
				$Camera2D/Label.text = nameuser + " - Sayang sekali ikan terlepas "
				$Camera2D/Control/PanelActionFishing.hide()
				$Camera2D/Control/Keterangan.hide()
				foundFish.find_node("Move").play = true
				$Camera2D/Control/Karakter.set_texture(idleCharachter)
				foundFish = null
			pass
func inputToProfile(var bonus,var persen, var beratIkan):
	var hasilBeratIkan = find_parent("Root").beratIkan + beratIkan 
	if(find_parent("Root").maxBeratIkan >= hasilBeratIkan):
		find_parent("Root").gold += bonus + (bonus*persen)/100
		find_parent("Root").beratIkan = hasilBeratIkan
		return true
	else:
		return false
	pass
	
func _physics_process(delta):
	if(!Root.PauseMode):
		var valueBoatSelected = profile.boat.boats[profile.infoUser.infoGame.boats[profile.infoUser.infoGame.idUseBoat]];
		var getValueUmpan = profile.umpans.umpan[profile.infoUser.infoGame.umpan[profile.infoUser.infoGame.idUseUmpan]]
		maximalRandom = valueBoatSelected.maxRandom - getValueUmpan.removeRandom
		speed = valueBoatSelected.speed
		get_action()
		processPlayFishing()
		if(action == false):
			get_moving()
			velocity = move_and_slide(velocity)
			var myKordinat = find_parent("Root").position + position + get_parent().position
			profile.infoUser.infoGame.vector = myKordinat
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
