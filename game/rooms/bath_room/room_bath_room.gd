@tool
extends PopochiuRoom

const Data := preload('room_bath_room_state.gd')

var state: Data = load("res://game/rooms/bath_room/room_bath_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	var exit_bedroom_hotspot = R.BathRoom.get_hotspot("ExitBedRoom")
	C.Mel.face_left()
	
	match C.player.last_room:
		"BedRoom":
			C.Mel.position = exit_bedroom_hotspot.position
		"Closet":
			var exit_closet_hotspot = R.BathRoom.get_hotspot("ExitClosetRoom")
			C.Mel.face_right()
			C.Mel.position = exit_closet_hotspot.position
		_:
			C.Mel.position = exit_bedroom_hotspot.position


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
