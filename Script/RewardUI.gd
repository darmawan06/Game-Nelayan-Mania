extends Control

var gold = 0
var kg = 0
var EXP = 0
var rank = 1000
var global
var level = 0
func _ready():
	pass

func _process(delta):
	EXP = (1000/rank) + kg
	$Panel/LabelGold.text = "Gold : " + String(gold)
	$Panel/LabelKG.text = "Ikan : " + String(kg) + "KG"
	$Panel/LabelExp.text = "EXP : " + String(EXP) + "/" + String(level*100)
	$"Panel/Label Rank".text = "Rank : " + String(rank)

	pass
