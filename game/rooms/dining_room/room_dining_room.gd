@tool
extends PopochiuRoom

const Data := preload('room_dining_room_state.gd')

var state: Data = load("res://game/rooms/dining_room/room_dining_room.tres")


func _check_player_entering():
	var door_bed_room_prop = R.DiningRoom.get_prop("DoorBedRoom")
	door_bed_room_prop.current_frame = 0
	var bed_room_door_position = door_bed_room_prop.position + door_bed_room_prop.walk_to_point + Vector2(0, 40)
	C.Mel.face_left()
	match C.player.last_room:
		"BedRoom":
			C.Mel.face_left()
			C.Mel.position = bed_room_door_position
		_:
			C.Mel.position = bed_room_door_position
			
#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	GameHelpers.set_main_cam_limits_from_room(self)
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
