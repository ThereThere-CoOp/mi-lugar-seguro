@tool
extends PopochiuDialog


#region Virtual ####################################################################################
func _on_start() -> void:
	await E.wait(3.5)
	await C.Ed.fade_in(0.1)
	await C.Ed.walk_to(C.Ed.global_position + Vector2(-40,-80))
	await C.Ed.face_left()
	await C.Ed.say("Buenos dias !!")
	await C.Ed.say("Buenos dias cosi !!")
	E.camera.shake(0.6, 1.5)
	await C.Ed.say("BUENOS DIAS !!!!")
	# await C.Mel.walk_to_marker("InitialPosition")
	
	# C.Mel.can_move = true
	# E.gui.show()
	
	await PopochiuUtils.e.get_tree().process_frame


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	await D.say_selected()
	
	# Use match to check which option was selected and execute something for
	# each one
	match opt.id:
		"bd":
			await C.Mel.say("Buenos dias.")
			await C.Ed.say("Buenos dias dormilona.")
		"bda":
			await C.Mel.say("Buenos dias amor!!.")
			await C.Ed.say("Buenos dias dormilona.")
		"grrr":
			E.camera.shake(0.6, 1.5)
			await C.Mel.say("Grrrrr!!!")
			await C.Mel.say("Por que no me puedes despertar de manera mas tierna!!!")
			await C.Ed.say("Es que no te despertabas.")
			await C.Mel.say("Podrias darme un besito o dos!")
			await C.Ed.say("Lo siento cosi.")
			await C.Mel.say("No te preocupes.")
			await C.Mel.say("Buenos dias a ti mi amor.")
		_:
			# By default close the dialog. Options won't show after calling
			stop()
	stop()
	D.Despertar2.start()
	# _show_options()


# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
