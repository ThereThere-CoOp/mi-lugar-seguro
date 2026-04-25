class_name GameHelpers
extends Node


static func set_main_cam_limits_from_room(room: PopochiuRoom) ->void:
	E.camera.limit_left = int(room.limit_left)
	E.camera.limit_right = int(room.limit_right)
	E.camera.limit_top = int(room.limit_top)
	E.camera.limit_bottom = int(room.limit_bottom)
