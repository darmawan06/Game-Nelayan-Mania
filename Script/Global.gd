extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var i = 0;
onready var infoUser = {
	"profile": {
		"name" : "Dikdik Darmawan",
		"email" : "s"
		},
	"infoGame" : {
		"money" : 50000,
		"vector" : Vector2(),
		"boats" : Array([7,6]),
		"umpan" : Array([3,2]),
		"idUseBoat" : 0,
		"idUseUmpan" : 0,
		"level" : 1,
		"exp" : 0
		}
	}

onready var boat = {
	"boats" : [{
		"id" : 0,
		"harga" : 50000,
		"name" : "Kapal Jaring Angkat",
		"path" : "res://Perahu/Kapal Jaring Angkat.png",
		"maxRandom" : 100,
		"speed" : 500
	},{
		"id" : 1,
		"harga" : 45000,
		"name" : "Kapal Jaring Insang",
		"path" : "res://Perahu/Kapal Jaring Insang.png",
		"maxRandom" : 500,
		"speed" : 450
	},{
		"id" : 2,
		"harga" : 40000,
		"name" : "Kapal Pancing Joran",
		"path" : "res://Perahu/Kapal Pancing Joran.png",
		"maxRandom" : 800,
		"speed" : 400
	},{
		"id" : 3,
		"harga" : 35000,
		"name" : "Kapal Pukat Hela",
		"path" : "res://Perahu/Kapal Pukat Hela.png",
		"maxRandom" : 1000,
		"speed" : 350
	},{
		"id" : 4,
		"harga" : 30000,
		"name" : "Kapal Rawai",
		"path" : "res://Perahu/Kapal Rawai.png",
		"maxRandom" : 1300,
		"speed" : 300
	},{
		"id" : 5,
		"harga" : 25000,
		"name" : "Perahu Dredger",
		"path" : "res://Perahu/Perahu Dredger.png",
		"maxRandom" : 1500,
		"speed" : 250
	},{
		"id" : 6,
		"harga" : 20000,
		"name" : "Perahu Jukung",
		"path" : "res://Perahu/Perahu Jukung.png",
		"maxRandom" : 1800,
		"speed" : 200

	},{
		"id" : 7,
		"harga" : 15000,
		"name" : "Perahu Kano",
		"path" : "res://Perahu/Perahu Kano.png",
		"maxRandom" : 2000,
		"speed" : 150
	}]
}

onready var umpans = {
	"umpan" : [{
		"id" : 0,
		"harga" : 30000,
		"name" : "Mermaid Knight",
		"path" : "res://Umpan/MermaidKnight.png",
		"removeRandom" : 300,
		"bonus" : 100
	},{
		"id" : 1,
		"harga" : 25000,
		"name" : "Minnow",
		"path" : "res://Umpan/minnow.png",
		"removeRandom" : 200,
		"bonus" : 75
	},{
		"id" : 2,
		"harga" : 20000,
		"name" : "OEM",
		"path" : "res://Umpan/oem.png",
		"removeRandom" : 100,
		"bonus" : 60
	},{
		"id" : 3,
		"harga" : 15000,
		"name" : "Weagen2",
		"path" : "res://Umpan/weagen2.png",
		"removeRandom" : 30,
		"bonus" : 50
	}]
}
onready var fishs = [{
	"id" : 0,
	"bonusCoin" : [150,100,50],
	"path" : "res://Ikan/fishTile_073.png"
},{
	"id" : 1,
	"bonusCoin" : [200,150,100],
	"path" : "res://Ikan/fishTile_075.png"
},{
	"id" : 2,
	"bonusCoin" : [250,200,150],
	"path" : "res://Ikan/fishTile_077.png"
},{
	"id" : 3,
	"bonusCoin" : [200,150,100],
	"path" : "res://Ikan/fishTile_079.png"
},{
	"id" : 4,
	"bonusCoin" : [250,100,50],
	"path" : "res://Ikan/fishTile_081.png"
},{
	"id" : 5,
	"bonusCoin" : [1000,500,300],
	"path" : "res://Ikan/fishTile_100.png"
},{
	"id" : 6,
	"bonusCoin" : [5000,3300,20],
	"path" : "res://Ikan/fishTile_103.png"
}]

onready var maps = [{
	"id" : 0,
	"path" : "res://Maps/MapSampul.tscn",
	"size" : [6736,4184]
},{
	"id" : 1,
	"path" : "res://Maps/LautJawa.tscn",
	"size" : [13112,7216]
},{
	"id" : 2,
	"path" : "res://Maps/LautSulawesi.tscn",
	"size" : [13512,8472]	
},{
	"id" : 3,
	"path" : "res://Maps/LautTimur.tscn",
	"size" : [13512,7216]	
},{
	"id" : 4,
	"path" : "res://Maps/LautAurafura.tscn",
	"size" : [13512,7216]	
},{
	"id" : 5,
	"path" : "res://Maps/LautBanda.tscn",
	"size" : [13512,7216]	
}]
var usernames = [
	"sheldrake",
	"bath",
	"rabble",
	"crushing",
	"danish",
	"employer","walnuts",
	"factor","butler","hover",
	"signal","turtleback","kerching","overrated",
	"link","sute","vanishing","sambar","structure","toys","alluring","lateen","harass","usually","actress",
	"snowboard","volary","fence","atmosphere","cue","labour","brash","fountain","mew",
	"sulphur","earrings","easily","channel","fearful","modified","hardball",
	"expense","digress","evanescent","great","vault","during","bend","booby","remove",
	"spritsail","given","upright","champion","mongolian","pack","curriculum","codger","rifle",
	"canoeing","hive","telescope","rat","homes","statuesque","femur","singer","risotto",
	"void","forefoot","sport","stormy","collected","picky","reform","congress"
	]
onready var mapSelected = 0;
onready var volumeDb = 0.0
onready var fullscreen = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
