extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nodeFish
var global
var root
var userGetFish
# Called when the node enters the scene tree for the first time.
func _ready():
	global = get_node("/root/Global")
	root = find_parent("Root")
	$NFish.min_value = 0
	$NFish.max_value = find_parent("Root").find_node("ikan-ikan").nIkan
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	nodeFish =  find_parent("Root").find_node("ikan-ikan")
	$NFish.value = nodeFish.get_child_count()
	var getBuatPemainLain = find_parent("Root").find_node("BuatPemainLain")
	var allGetFishForRank = Array()
	userGetFish = root.beratIkan;
	for i in getBuatPemainLain.get_child_count():
		allGetFishForRank.append(Array([getBuatPemainLain.get_child(i).find_node("Move").nama,getBuatPemainLain.get_child(i).find_node("Move").nGetFish]))

	allGetFishForRank.append(Array(["Anda",userGetFish]))
	sort(allGetFishForRank)
	var cariRankSaya = 0;
	for i in len(allGetFishForRank):
		if(allGetFishForRank[i][0] == "Anda"):
			cariRankSaya = i
			break	
	$Ranks/ColorRect/LabelRank.text = ""
	for i in 5:
		$Ranks/ColorRect/LabelRank.text += String(i+1)+". " + String(allGetFishForRank[i][0]) + " - " + String(allGetFishForRank[i][1]) + "KG" + "\n"
	pass
	if(cariRankSaya >= 5):
		$Ranks/ColorRect/LabelRank.text += String(cariRankSaya+1)+". " + String(allGetFishForRank[cariRankSaya][0]) + " - " + String(allGetFishForRank[cariRankSaya][1]) + "KG" + "\n"
	find_parent("Root").rank = cariRankSaya+1
	pass

func sort(var variabelArray):
	var min_idx = 0
	var i = 0
	var j = 0
	while i < (len(variabelArray)-1):
		min_idx = i
		j = i;
		while j < len(variabelArray):
			if(variabelArray[j][1] > variabelArray[min_idx][1]):
				min_idx = j
			j = j + 1
		var tamp = variabelArray[min_idx]
		variabelArray[min_idx] = variabelArray[i]
		variabelArray[i] = tamp
		i = i + 1
	pass
