@tool
extends PopochiuDialog


#region Virtual ####################################################################################
func _on_start() -> void:
	E.set_text_speed(0.05)
	await C.Narrator.say("Mel: ¿Habra algo interesante en la redes sociales?")
	await PopochiuUtils.e.get_tree().process_frame


func _option_selected(opt: PopochiuDialogOption) -> void:

	match opt.id:
		"youtube":
			await C.Narrator.say("Mel: Mi influencer de chismes favoritos a sacado otro video")
			await C.Narrator.say("Mel: ¿De que sera la polémica hoy?")
			E.set_text_speed(1)
			await R.goto_room("Limonchi")
		"whatsapp":
			await C.Narrator.say("Mel: Parece que tengo mensajes nuevos")
			await C.Narrator.say("Mel: Sera mejor que revise")
		"exit":
			E.set_text_speed(1)
			stop()
		_:
			# By default close the dialog. Options won't show after calling
			# stop()
			E.set_text_speed(1)
			stop()
	
	_show_options()


# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
