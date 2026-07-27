@tool
extends PopochiuRoom

const Data := preload('room_limonchi_state.gd')

var state: Data = load("res://game/rooms/limonchi/room_limonchi.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	E.set_text_speed(0.05)
	await E.queue([
		C.Narrator.queue_say("Admian Limonchi: Hola limoncitos, en el video de hoy les traigo noticia de ultima hora"),
		C.Narrator.queue_say("Admian Limonchi: Después de tanto tiempo por fin \"La Suave\" ha publicado fotos en Instagram con su nuevo novio"),
		C.Narrator.queue_say("Admian Limonchi: lo que ya confirma lo que seria su pareja numero 365 en lo que va del 2026"),
		C.Narrator.queue_say("Admian Limonchi: Que locura tiene esta niña después que se separo de su pareja de muchos  años Juan ForNever...."),
	])
	E.set_text_speed(1)
	await C.Narrator.say("Mel: Al final no era nada polemico. Estos chismes de \"La Suave\" están aburriendo un poco")


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to execute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
