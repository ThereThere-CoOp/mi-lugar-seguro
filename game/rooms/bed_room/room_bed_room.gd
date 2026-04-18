@tool
extends PopochiuRoom

const Data := preload('room_bed_room_state.gd')

var state: Data = load("res://game/rooms/bed_room/room_bed_room.tres")

var mel_bed_initial_cutscene_position: Vector2 = Vector2(175, 147)


func _check_player_entering():
	var exit_dining_room_hotspot = R.BedRoom.get_hotspot("ExitDiningRoom")
	C.Mel.face_left()
	match C.player.last_room:
		"BathRoom":
			C.Mel.face_right()
			var exit_bathroom_hotspot = R.BedRoom.get_hotspot("ExitBathRoom")
			C.Mel.position = exit_bathroom_hotspot.position
		"DiningRoom":
			C.Mel.position = exit_dining_room_hotspot.position
		_:
			C.Mel.position = exit_dining_room_hotspot.position
				
				
#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	C.Ed.set_alpha(0)
	C.Ed.clickable = false
	
	if not C.player.state.despertar_cutscene_watched:
		# setup for initial cutscene
		C.Mel.position = mel_bed_initial_cutscene_position
		C.Mel.can_move = false
	else:
		_check_player_entering()
	

# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	if not C.player.state.despertar_cutscene_watched:
		D.Despertar1.start()


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
