@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRDiningRoom := preload("res://game/rooms/dining_room/room_dining_room.gd")
const PRBedRoom := preload("res://game/rooms/bed_room/room_bed_room.gd")
# ---- classes

# nodes ----
var DiningRoom: PRDiningRoom : get = get_DiningRoom
var BedRoom: PRBedRoom : get = get_BedRoom
# ---- nodes

# functions ----
func get_DiningRoom() -> PRDiningRoom: return get_runtime_room("DiningRoom")
func get_BedRoom() -> PRBedRoom: return get_runtime_room("BedRoom")
# ---- functions

