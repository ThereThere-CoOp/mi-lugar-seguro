@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRDiningRoom := preload("res://game/rooms/dining_room/room_dining_room.gd")
# ---- classes

# nodes ----
var DiningRoom: PRDiningRoom : get = get_DiningRoom
# ---- nodes

# functions ----
func get_DiningRoom() -> PRDiningRoom: return get_runtime_room("DiningRoom")
# ---- functions

