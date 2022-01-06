
class Fishing extends MainLoop:
	var time_elapsed = 0
	var quit = false
	
	func _initialize():
		print("initialize :")
		print(" Starting time : %s" % str(time_elapsed))

	func _idle(delta):
		time_elapsed += delta
		return quit
		
	func _input_event(event):
		if Input.is_action_pressed("cancel_fishing"):
			quit = true
	func _finalize():
		print("End time %s" % str(time_elapsed))
