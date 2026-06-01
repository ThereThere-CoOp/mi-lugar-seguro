@tool
extends PopochiuDialog


#region Virtual ####################################################################################
func _on_start() -> void:
	# resolving temperature:
	if C.Mel.state.thermostat_configuration == GameConstants.ThermostatConfigurationChoice.BALANCED \
	and not C.Mel.state.thermostat_balanced_resolved:
		await C.Ed.say("La temperatura esta perfecta, gracias amor")
		C.Mel.state.thermostat_balanced_resolved = true
		C.Mel.state.increase_relationship_level(2)
		
	if C.Mel.state.thermostat_configuration == GameConstants.ThermostatConfigurationChoice.HOT \
	and not C.Mel.state.thermostat_cold_resolved \
	and C.Mel.state.thermostat_cold_talked:
		await C.Ed.say("Ya no tengo frio, pero creo que la temperatura esta un poco alta.")
		C.Mel.state.thermostat_cold_resolved = true
		C.Mel.state.increase_relationship_level(1)
		
	if C.Mel.state.thermostat_configuration == GameConstants.ThermostatConfigurationChoice.COLD \
	and not C.Mel.state.thermostat_hot_resolved \
	and C.Mel.state.thermostat_hot_talked:
		C.Ed.say("Ya no tengo calor, pero creo que la temperatura esta un poco baja.")
		C.Mel.state.thermostat_hot_resolved = true
		C.Mel.state.increase_relationship_level(1)
		
	await C.Ed.say("¿En que te puedo ayudar, amor?")


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	await D.say_selected()
	
	# Use match to check which option was selected and execute something for
	# each one
	match opt.id:
		"cold":
			await C.Ed.say("Si, tengo un poco de frio")
			await C.Ed.say("Hay que subir un poco la temperatura")
			
			C.Mel.state.thermostat_cold_talked = true
		"hot":
			await C.Ed.say("Si, esta haciendo un poco de calor")
			await C.Ed.say("Hay que bajar un poco la temperatura")
			
			C.Mel.state.thermostat_hot_talked = true
			
			if not C.Mel.state.thermostat_hot:
				C.Mel.state.thermostat_hot = true
				C.Mel.state.increase_relationship_level(1)
			
		_:
			# By default close the dialog. Options won't show after calling
			# stop()
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
