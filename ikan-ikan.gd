extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ikan
var global;
export var nIkan = 100
var rng = RandomNumberGenerator.new()
var root
# Called when the node enters the scene tree for the first time.
func _ready():
	var global = get_node("/root/Global")
	var valueFish = global.fishs
	var i =0;
	var node = load("res://TSCN/ikan.tscn")
	var nodeInstance
	root = find_parent("Root")
	var sizeMap = global.maps[global.mapSelected].size
	while i < nIkan:
		nodeInstance = node.instance()
		rng.randomize()
		var findX = rng.randi_range(300,sizeMap[0]-300)
		var findY = rng.randi_range(300,sizeMap[1]-300)
		var randKG = rng.randi_range(15,30)
		nodeInstance.set_position(Vector2(findX,findY))
		nodeInstance.find_node("Move").beratSemuaIkan = randKG
		var coll = nodeInstance.find_node("CollisionShape2D")
		var x = 0
		var indexFish = rng.randf_range(0,len(valueFish))
		nodeInstance.find_node("Move").bonusCoin = valueFish[indexFish].bonusCoin

		while x < randKG:
			rng.randomize()
			findX = rng.randi_range(-300,300)
			findY = rng.randi_range(-300,300)
			var sprite = Sprite.new()
			sprite.position.x = findX
			sprite.position.y = findY
			sprite.set_texture(load(valueFish[indexFish].path))
			coll.add_child(sprite)
			x+=1
			pass
		call_deferred("add_child",nodeInstance)
		i+= 1
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
