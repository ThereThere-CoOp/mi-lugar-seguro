@tool
extends PopochiuRoom

const Data := preload('room_bed_room_state.gd')

var state: Data = load("res://game/rooms/bed_room/room_bed_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	E.cutscene([
		"Mel: Hola, bienvenido",
		"Mel: Espero que te encuentres bien",
		C.Mel.queue_walk_to_marker("InitialPosition"),
	])


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
