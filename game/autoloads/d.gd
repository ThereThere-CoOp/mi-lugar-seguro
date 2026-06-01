@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDDespertar1 := preload("res://game/dialogs/despertar_1/dialog_despertar_1.gd")
const PDDespertar2 := preload("res://game/dialogs/despertar_2/dialog_despertar_2.gd")
const PDChangeClothes := preload("res://game/dialogs/change_clothes/dialog_change_clothes.gd")
const PDThermostatConfig := preload("res://game/dialogs/thermostat_config/dialog_thermostat_config.gd")
const PDEdDialog := preload("res://game/dialogs/ed_dialog/dialog_ed_dialog.gd")
# ---- classes

# nodes ----
var Despertar1: PDDespertar1 : get = get_Despertar1
var Despertar2: PDDespertar2 : get = get_Despertar2
var ChangeClothes: PDChangeClothes : get = get_ChangeClothes
var ThermostatConfig: PDThermostatConfig : get = get_ThermostatConfig
var EdDialog: PDEdDialog : get = get_EdDialog
# ---- nodes

# functions ----
func get_Despertar1() -> PDDespertar1: return get_instance("Despertar1")
func get_Despertar2() -> PDDespertar2: return get_instance("Despertar2")
func get_ChangeClothes() -> PDChangeClothes: return get_instance("ChangeClothes")
func get_ThermostatConfig() -> PDThermostatConfig: return get_instance("ThermostatConfig")
func get_EdDialog() -> PDEdDialog: return get_instance("EdDialog")
# ---- functions
