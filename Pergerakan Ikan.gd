extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var velocity = Vector2()
export var speed = 200
var on_wall = 0
export var play = true
var rng = RandomNumberGenerator.new()
var beratSemuaIkan
var Gomove
var YMove = true
var bonusCoin = Array()

func deteleIfCrash():
	if(is_on_wall() && on_wall >= -3):
		on_wall+= 1
	elif(on_wall >= -100):
		on_wall-=1
		
	if(on_wall >= 3):
		get_parent().queue_free()

func rand_Y():
	var boolean
	rng.randomize()
	if(rng.randi_range(0,1) == 0):
		boolean = true
	else:
		boolean = false
	return boolean
	pass

func move():
	velocity = Vector2()
	if(is_on_wall() && Gomove == true):
		Gomove = false
		YMove = rand_Y()
	elif(is_on_wall() && Gomove == false):
		Gomove = true
		YMove = rand_Y()
	
	if(Gomove == true):
		velocity.x += 1
		if(YMove):
			velocity.y += 1
		else:
			velocity.y -= 1
		
		var i = 0
		var nChild = $CollisionShape2D.get_child_count()
		while i < nChild:
			$CollisionShape2D.get_child(i).flip_h = false
			i+=1
			pass			
	else:
		velocity.x -= 1
		if(YMove):
			velocity.y += 1
		else:
			velocity.y -= 1
		
		var i = 0
		var nChild = $CollisionShape2D.get_child_count()
		while i < nChild:
			$CollisionShape2D.get_child(i).flip_h = true
			i+=1
			pass

	velocity = velocity.normalized()*speed
# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Label.text = String(beratSemuaIkan) + "KG"
	if(rng.randi_range(0,1) == 0):
		Gomove = true
	else:
		Gomove = false
	
	YMove = rand_Y()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(play):
		deteleIfCrash()
		move()
		velocity = move_and_slide(velocity)
	pass
