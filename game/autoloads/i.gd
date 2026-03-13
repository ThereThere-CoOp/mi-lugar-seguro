@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIMakeup := preload("res://game/inventory_items/makeup/inventory_item_makeup.gd")
const PIILipstick := preload("res://game/inventory_items/lipstick/inventory_item_lipstick.gd")
# ---- classes

# nodes ----
var Makeup: PIIMakeup : get = get_Makeup
var Lipstick: PIILipstick : get = get_Lipstick
# ---- nodes

# functions ----
func get_Makeup() -> PIIMakeup: return get_item_instance("Makeup")
func get_Lipstick() -> PIILipstick: return get_item_instance("Lipstick")
# ---- functions
