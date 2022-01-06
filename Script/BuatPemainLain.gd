extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ikan
var global;
export var nPemain =1
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var i =0;
	global = get_node("/root/Global")
	var boats = global.boat.boats
	var node = load("res://TSCN/Pemain_Lain.tscn")
	var nodeInstance
	var root = find_parent("Root")
	var sizeMap = global.maps[global.mapSelected].size
	while i < nPemain:
		nodeInstance = node.instance()
		rng.randomize()
		var findX = rng.randi_range(1000,sizeMap[0]-1000)
		var findY = rng.randi_range(1000,sizeMap[1]-1000)
		nodeInstance.set_position(Vector2(findX,findY))
		var coll = nodeInstance.find_node("CollisionShape2D")
		var sprite = Sprite.new()
		sprite.position.x = 0
		sprite.position.y = 0
		sprite.scale.x = 0.3
		sprite.scale.y = 0.3
		rng.randomize()
		var index = rng.randi_range(0,len(boats)-1)
		nodeInstance.find_node("Move").speed = boats[index].speed
		nodeInstance.find_node("Move").nama = global.usernames[rng.randf_range(0,len(global.usernames))]
		sprite.set_texture(load(boats[index].path))
		coll.add_child(sprite)
	
		call_deferred("add_child",nodeInstance)
		i+= 1
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
