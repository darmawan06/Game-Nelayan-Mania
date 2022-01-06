extends TextEdit


func _ready():
	text = "Hover to a Form Chat with Mouse And Enter"
	pass
	
func _process(delta):
	if(readonly):
		if(Input.is_action_just_pressed("ui_accept")):
			text = ""
			readonly = false
			pass
	else:
		if(Input.is_action_just_pressed("ui_accept")):
			if(text.length() > 0):
				find_parent("Control").find_node("Chat").get_child(0).text += "Kamu : " + text
			text = "Enter for chat"
			readonly = true
			pass
		pass
	pass
