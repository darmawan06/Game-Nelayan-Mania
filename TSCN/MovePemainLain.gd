extends KinematicBody2D
var rng = RandomNumberGenerator.new()
var velocity = Vector2()
var foundFish = null
var nama
var nGetFish;
var nodeFishs
var goX;
var goY;
var speed = 0;
var on_wall = 0;
var findFishing = 0;
var targetFishing = 0;
func deteleIfCrash():
	
	if(is_on_wall() && on_wall >= -3):
		on_wall+= 1
	elif(on_wall >= -100):
		on_wall-=1
	if(on_wall >= 3):
		get_parent().queue_free()
		
func _ready():
	nodeFishs = find_parent("Root").find_node("ikan-ikan")
	$Name.text = nama;
	nGetFish = 0
	pass

func checkFish(var pos1, var pos2, var nodeFish):
	var checkX =  pos1.x - pos2.x
	var checkY = pos1.y - pos2.y
	if((checkX > -200 && checkX < 200) && checkY > -200 && checkY < 200):
		nodeFish.find_node("Move").play = false
		return true
	else:
		return false
	pass
func moveIkan():
	if is_instance_valid(foundFish):
		$ColorRect.color = Color.greenyellow
		var positionFish = foundFish.get_node("Move").position
		var pemain_position = find_parent("Root").position + position + get_parent().position
		var fish_position = find_parent("Root").position + positionFish + foundFish.position
		if(!checkFish(pemain_position,fish_position,foundFish)):
			velocity = Vector2()
			$Tujuan.text = String("Mencari Ikan")
			if(fish_position.x > pemain_position.x):
				velocity.x += 0.5 * speed
				$CollisionShape2D.get_child(1).flip_h = true
			else :
				velocity.x -= 0.5 * speed
				$CollisionShape2D.get_child(1).flip_h = false
			if(fish_position.y > pemain_position.y):
				velocity.y += 0.5 * speed
			else :
				velocity.y -= 0.5 * speed
		else:
			rng.randomize()
			$ColorRect.color = Color.slateblue
			$Tujuan.text = String("Mulai Memancing")
			if(targetFishing == 0):
				targetFishing = rng.randi_range(0,250);
			elif(targetFishing == findFishing):
				targetFishing = 0;
				nGetFish += foundFish.find_node("Move").beratSemuaIkan
				foundFish.queue_free()
			else:
				findFishing = rng.randi_range(0,250)
	else:
		foundFish = null;
		velocity = velocity.normalized()*speed
	pass
func searchFish():
	if(!is_instance_valid(foundFish)):
		rng.randomize()
		if(nodeFishs.get_child_count() != 0):
			var getChild = rng.randi_range(0,nodeFishs.get_child_count()-1)
			foundFish = nodeFishs.get_child(getChild)		
	pass
func _process(delta):
	deteleIfCrash()
	searchFish()
	moveIkan()
	velocity = move_and_slide(velocity)
	pass
