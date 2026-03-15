@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRDiningRoom := preload("res://game/rooms/dining_room/room_dining_room.gd")
const PRBedRoom := preload("res://game/rooms/bed_room/room_bed_room.gd")
const PRPrologue := preload("res://game/rooms/prologue/room_prologue.gd")
const PRBathRoom := preload("res://game/rooms/bath_room/room_bath_room.gd")
# ---- classes

# nodes ----
var DiningRoom: PRDiningRoom : get = get_DiningRoom
var BedRoom: PRBedRoom : get = get_BedRoom
var Prologue: PRPrologue : get = get_Prologue
var BathRoom: PRBathRoom : get = get_BathRoom
# ---- nodes

# functions ----
func get_DiningRoom() -> PRDiningRoom: return get_runtime_room("DiningRoom")
func get_BedRoom() -> PRBedRoom: return get_runtime_room("BedRoom")
func get_Prologue() -> PRPrologue: return get_runtime_room("Prologue")
func get_BathRoom() -> PRBathRoom: return get_runtime_room("BathRoom")
# ---- functions
