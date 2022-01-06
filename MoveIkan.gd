extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
var speed = 100;
var move_rotate = 0;
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func moving():
	if(rng.randi_range(0,10) % 2 == 0):
		velocity.x += 1
	elif(rng.randi_range(0,10) % 2 == 1):
		velocity.x -= 1
	velocity = velocity.normalized()*speed;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moving()
	velocity = move_and_slide(velocity)
	pass
