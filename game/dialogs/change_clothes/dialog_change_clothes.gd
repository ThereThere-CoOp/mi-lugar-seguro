@tool
extends PopochiuDialog


func _change_clothes(clothes_id: int):
	var current_clothes = C.Mel.state.current_clothes
	
	if current_clothes == clothes_id:
		await C.Mel.say("Ya tengo puesta esa ropa.")
		return
	
	
	await T.play_transition("fade", 1, PopochiuTransitionLayer.PLAY_MODE.OUT)
	await A.sfx_clothes.play(true)
	C.Mel.change_clothes(clothes_id)
	await T.play_transition("fade", 2, PopochiuTransitionLayer.PLAY_MODE.IN)
	
	
#region Virtual ####################################################################################
func _on_start() -> void:
	await C.Mel.say("¿Qué ropa debo usar para hoy?")


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	await D.say_selected()
	
	# Use match to check which option was selected and execute something for
	# each one
	match opt.id:
		"pajama":
			_change_clothes(GameConstants.MelChlothesChoice.PAJAMA)
		"work":
			_change_clothes(GameConstants.MelChlothesChoice.DIARY)
		"bikini":
			_change_clothes(GameConstants.MelChlothesChoice.BIKINI)
		"none":
			stop()
		_:
			# By default close the dialog. Options won't show after calling
			# stop()
			stop()
	
	stop()


# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
