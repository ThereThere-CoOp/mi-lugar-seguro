@tool
extends PopochiuRoom

const Data := preload('room_closet_state.gd')

var state: Data = load("res://game/rooms/closet/room_closet.tres")


func _check_player_entering():
	var exit_bathroom_hotspot = R.Closet.get_hotspot("ExitBathRoom")
	
	match C.player.last_room:
		"BathRoom":
			C.Mel.face_left()
			C.Mel.position = exit_bathroom_hotspot.position + Vector2(-10, 0)
		_:
			C.Mel.face_left()
			C.Mel.position = exit_bathroom_hotspot.position + Vector2(-10, 0)
			
			
#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	_check_player_entering()


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
