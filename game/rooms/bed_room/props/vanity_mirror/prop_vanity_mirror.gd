@tool
extends PopochiuProp
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the execution of
# the function until the sequence of events finishes.


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	await C.player.walk_to_clicked()
	await C.player.say("El espejo de mi vanity. Lo uso para maquillarme y peinarme.")


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	PopochiuUtils.e.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# When the node is right clicked
func _on_right_click() -> void:
	await C.player.face_clicked()
	await C.player.say("El espejo de mi vanity. Lo uso para maquillarme y peinarme.")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	PopochiuUtils.e.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item == I.Makeup:
		if not C.Mel.state.applied_makeup:
			await C.player.walk_to_clicked()
			
			if C.Mel.state.chosen_day_schedule == GameConstants.DayScheduleChoice.POOL:
				await C.player.say("Ya que vamos a la piscina no usare tanto maquillaje.")
				await C.player.say("Solo un poco de base, por si me meto en el agua.")
			else:
				await C.player.say("Hoy debo arreglarme un poco mejor.")
				await C.player.say("Probablemente haya visita en el trabajo.")
			
			if C.Mel.state.chosen_day_schedule == GameConstants.DayScheduleChoice.POOL:
				await C.Narrator.say("Mel se maquilla para ir a la piscina.")
			else:
				await C.Narrator.say("Mel se maquilla para ir al trabajo.")
				
			await C.Narrator.say("No importa si es con o sin maquillaje.")
			await C.Narrator.say("De cualquier manera se ve preciosa.")

			C.Mel.state.increase_relationship_level(1)
			C.Mel.state.applied_makeup = true
		else:
			await C.player.say("Ya me he maquillado.")
			
	if item == I.Lipstick:
		if not C.Mel.state.applied_lipstick:
			await C.player.walk_to_clicked()
			
			await C.player.say("Este es mi color favorito.")
				
			await C.Narrator.say("Mel se pinta sus labios.")
			await C.Narrator.say("Realmente realza lo hermosos que son.")

			C.Mel.state.increase_relationship_level(1)
			C.Mel.state.applied_lipstick = true
		else:
			await C.player.say("Ya me he maquillado.")
			
# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func _on_linked_item_removed() -> void:
	pass


# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func _on_linked_item_discarded() -> void:
	pass


# Called when the prop starts moving
func _on_movement_started() -> void:
	pass


# Called when the prop stops moving
func _on_movement_ended() -> void:
	pass


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
