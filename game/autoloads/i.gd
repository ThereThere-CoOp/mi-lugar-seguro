@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIMakeup := preload("res://game/inventory_items/makeup/inventory_item_makeup.gd")
# ---- classes

# nodes ----
var Makeup: PIIMakeup : get = get_Makeup
# ---- nodes

# functions ----
func get_Makeup() -> PIIMakeup: return get_item_instance("Makeup")
# ---- functions
