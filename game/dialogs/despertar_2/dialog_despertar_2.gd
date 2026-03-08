@tool
extends PopochiuDialog


#region Virtual ####################################################################################
func _on_start() -> void:
	var CupCoffe = R.get_prop("CupCoffee") 
	await C.Mel.say("¿Es muy tarde?")
	await C.Ed.say("Realmente no.")
	await C.Ed.say("Hice cafe.")
	await C.Ed.face_right()
	await C.Ed.say("Te lo voy a dejar en la mesita de noche.")
	await E.wait(1)
	CupCoffe.visible = true
	await E.wait(0.5)
	await C.Ed.face_left()
	await C.Mel.say("Gracias amor")
	await C.Ed.say("No hay de que cosi.")
	await C.Ed.say("¿Tienes que trabajar hoy por la tarde?")
	await PopochiuUtils.e.get_tree().process_frame


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	await D.say_selected()
	
	# Use match to check which option was selected and execute something for
	# each one
	match opt.id:
		"piscina":
			await C.Mel.say("Hoy descanso por la tarde.")
			await C.Ed.say("Que bueno.")
			await C.Ed.say("Podemos ir a la piscina por la tarde.")
			await C.Mel.say("Wiiiiii!!!!")
			await C.Ed.say("Es que tengo ganas.")
			await C.Ed.say("Hace tiempo que no vamos.")
			await C.Mel.say("Si yo también tengo ganas.") 	
			await C.Mel.say("Y necesito tomar el sol.") 
			await C.Mel.say("Vitaminas D a mí.")
			await C.Ed.say("Yo me puedo llevar mi libro.")
		"trabajo":
			await C.Mel.say("Si. Por desgracia.")
			await C.Ed.say("Oh. Se me arruinaron los planes.")
			await C.Mel.say("¿Cuales planes tenías?")
			await C.Ed.say("Quería pasar un día junto en la piscina.")
			await C.Ed.say("Me hacía mucha ilusión.")
			await C.Mel.say("A mi también me gustaría.") 	
			await C.Mel.say("Vamos a tener que dejarlo para otro día.") 
			await C.Ed.say("Si, que lastima.")
		_:
			# By default close the dialog. Options won't show after calling
			# stop()
			stop()
			
	await C.Mel.say("Mejor me levanto entonces y me aseo")
	await C.Mel.say("Antes que se haga más tarde.")
	await C.Ed.say("No olvides tomarte el café.")
	await C.Ed.say("Que se te va a enfríar.")
	await C.Mel.say("Si mi amor, muchas gracias.")
	
	await C.Mel.walk_to_marker("InitialPosition")
	
	C.Mel.can_move = true
	E.gui.show()
	
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
