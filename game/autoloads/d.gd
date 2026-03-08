@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDDespertar1 := preload("res://game/dialogs/despertar_1/dialog_despertar_1.gd")
const PDDespertar2 := preload("res://game/dialogs/despertar_2/dialog_despertar_2.gd")
# ---- classes

# nodes ----
var Despertar1: PDDespertar1 : get = get_Despertar1
var Despertar2: PDDespertar2 : get = get_Despertar2
# ---- nodes

# functions ----
func get_Despertar1() -> PDDespertar1: return get_instance("Despertar1")
func get_Despertar2() -> PDDespertar2: return get_instance("Despertar2")
# ---- functions

