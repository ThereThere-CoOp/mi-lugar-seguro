@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the execution of
# the function until the sequence of events finishes.


func _describe_computer():
	await C.Mel.say("Es la compu de Ed")
	await C.Mel.say("Es donde trabaja")
	await C.Mel.say("y hace sus videojuegos.")
	
	
#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	await C.player.walk_to_clicked()
	_describe_computer()


func _on_double_click() -> void:
	await C.player.walk_to_clicked()
	_describe_computer()


# When the node is right clicked
func _on_right_click() -> void:
	C.player.face_clicked()
	_describe_computer()


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	PopochiuUtils.e.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	PopochiuUtils.e.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# hotspot. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("No can do")


# Called when the hotspot starts moving
func _on_movement_started() -> void:
	pass


# Called when the hotspot stops moving
func _on_movement_ended() -> void:
	pass


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
