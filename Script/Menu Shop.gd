extends Control

var selected = true;
func _ready():

	
	pass
func btnEvent():
	if($BtnPerahu.pressed):
		selected = true
		$BtnPerahu2.pressed = false
	if($BtnPerahu2.pressed):
		selected = false
		$BtnPerahu.pressed = false
	pass
func _process(delta):

	$Money/Label.text = String(get_node("/root/Global").infoUser.infoGame.money)
	btnEvent()
	if(selected):
		$ColorRect2/GrupPerahu.visible = true
		$ColorRect2/GrupUmpan.visible = false
	else:
		$ColorRect2/GrupPerahu.visible = false
		$ColorRect2/GrupUmpan.visible = true
	pass
