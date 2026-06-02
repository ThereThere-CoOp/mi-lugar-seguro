@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIMakeup := preload("res://game/inventory_items/makeup/inventory_item_makeup.gd")
const PIILipstick := preload("res://game/inventory_items/lipstick/inventory_item_lipstick.gd")
const PIIToothbrush := preload("res://game/inventory_items/toothbrush/inventory_item_toothbrush.gd")
const PIIToothPaste := preload("res://game/inventory_items/tooth_paste/inventory_item_tooth_paste.gd")
const PIIToothbrushWithPaste := preload("res://game/inventory_items/toothbrush_with_paste/inventory_item_toothbrush_with_paste.gd")
# ---- classes

# nodes ----
var Makeup: PIIMakeup : get = get_Makeup
var Lipstick: PIILipstick : get = get_Lipstick
var Toothbrush: PIIToothbrush : get = get_Toothbrush
var ToothPaste: PIIToothPaste : get = get_ToothPaste
var ToothbrushWithPaste: PIIToothbrushWithPaste : get = get_ToothbrushWithPaste
# ---- nodes

# functions ----
func get_Makeup() -> PIIMakeup: return get_item_instance("Makeup")
func get_Lipstick() -> PIILipstick: return get_item_instance("Lipstick")
func get_Toothbrush() -> PIIToothbrush: return get_item_instance("Toothbrush")
func get_ToothPaste() -> PIIToothPaste: return get_item_instance("ToothPaste")
func get_ToothbrushWithPaste() -> PIIToothbrushWithPaste: return get_item_instance("ToothbrushWithPaste")
# ---- functions
