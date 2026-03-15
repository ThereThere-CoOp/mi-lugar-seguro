@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIMakeup := preload("res://game/inventory_items/makeup/inventory_item_makeup.gd")
const PIILipstick := preload("res://game/inventory_items/lipstick/inventory_item_lipstick.gd")
const PIIToothbrush := preload("res://game/inventory_items/toothbrush/inventory_item_toothbrush.gd")
# ---- classes

# nodes ----
var Makeup: PIIMakeup : get = get_Makeup
var Lipstick: PIILipstick : get = get_Lipstick
var Toothbrush: PIIToothbrush : get = get_Toothbrush
# ---- nodes

# functions ----
func get_Makeup() -> PIIMakeup: return get_item_instance("Makeup")
func get_Lipstick() -> PIILipstick: return get_item_instance("Lipstick")
func get_Toothbrush() -> PIIToothbrush: return get_item_instance("Toothbrush")
# ---- functions
