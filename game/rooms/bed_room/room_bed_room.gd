@tool
extends PopochiuRoom

const Data := preload('room_bed_room_state.gd')

var state: Data = load("res://game/rooms/bed_room/room_bed_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	C.Ed.set_alpha(0)
	C.Mel.can_move = false


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	await E.wait(3.5)
	await C.Ed.fade_in(0.1)
	await C.Ed.walk_to(C.Ed.global_position + Vector2(-10,-80))
	await C.Ed.face_left()
	await C.Ed.say("Buenos dias !!")
	await C.Ed.say("Buenos dias cosi !!")
	E.camera.shake(0.6, 1.5)
	await C.Ed.say("BUENOS DIAS !!!!")
	await C.Mel.walk_to_marker("InitialPosition")
	
	C.Mel.can_move = true
	E.gui.show()


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
