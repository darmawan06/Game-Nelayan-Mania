extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
var speed = 100;
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func moving():
	if(rng.randi_range(0,10) % 2 == 0):
		velocity = Vector2(-speed, 0).rotated(-1)
	else:
		velocity = Vector2(-speed, 0).rotated(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	moving()
	velocity = move_and_slide(velocity)
	pass
