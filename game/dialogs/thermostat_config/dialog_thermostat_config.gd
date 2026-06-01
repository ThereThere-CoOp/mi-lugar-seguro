@tool
extends PopochiuDialog


var thermostat_prop = R.DiningRoom.get_prop("Thermostat")


func _handle_options() -> void:
	turn_on_options(["balanced", "hot", "cold"])
	
	match C.Mel.state.thermostat_configuration:
		GameConstants.ThermostatConfigurationChoice.COLD:
			turn_off_options(["cold"])
		GameConstants.ThermostatConfigurationChoice.BALANCED:
			turn_off_options(["balanced"])
			# turn_on_options(["cold", "hot", "none"])
		GameConstants.ThermostatConfigurationChoice.HOT:
			turn_off_options(["hot"])
			# turn_on_options(["cold", "balanced", "none"])
		_:
			pass
			# turn_on_options(["cold", "balanced", "none", "hot"])
			
			
#region Virtual ####################################################################################
func _on_start() -> void:
	await C.Mel.say("¿Cual temperatura debo programar?")
	_handle_options()


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	await D.say_selected()
	
	# Use match to check which option was selected and execute something for
	# each one
	match opt.id:
		"cold":
			await C.player.say("Bajare un poco la temperatura.")
			C.Mel.state.thermostat_configuration = GameConstants.ThermostatConfigurationChoice.COLD
			
			C.Mel.state.thermostat_cold_talked = false
			
			await A.sfx_controller_button_press.play()
			thermostat_prop.set_current_frame(3)
		"balanced":
			await C.player.say("Pondre la temperatura en medio.")
			C.Mel.state.thermostat_configuration = GameConstants.ThermostatConfigurationChoice.BALANCED
			C.Mel.state.thermostat_balanced = true
			
			C.Mel.state.thermostat_cold_talked = false
			C.Mel.state.thermostat_hot_talked = false
			
			await A.sfx_controller_button_press.play()
			thermostat_prop.set_current_frame(1)
		"hot":
			await C.player.say("Pondre la calefaccion.")
			
			C.Mel.state.thermostat_hot_talked = false
			
			C.Mel.state.thermostat_configuration = GameConstants.ThermostatConfigurationChoice.HOT
			await A.sfx_controller_button_press.play()
			thermostat_prop.set_current_frame(2)
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
