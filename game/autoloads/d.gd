@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDDespertar1 := preload("res://game/dialogs/despertar_1/dialog_despertar_1.gd")
const PDDespertar2 := preload("res://game/dialogs/despertar_2/dialog_despertar_2.gd")
const PDChangeClothes := preload("res://game/dialogs/change_clothes/dialog_change_clothes.gd")
# ---- classes

# nodes ----
var Despertar1: PDDespertar1 : get = get_Despertar1
var Despertar2: PDDespertar2 : get = get_Despertar2
var ChangeClothes: PDChangeClothes : get = get_ChangeClothes
# ---- nodes

# functions ----
func get_Despertar1() -> PDDespertar1: return get_instance("Despertar1")
func get_Despertar2() -> PDDespertar2: return get_instance("Despertar2")
func get_ChangeClothes() -> PDChangeClothes: return get_instance("ChangeClothes")
# ---- functions
