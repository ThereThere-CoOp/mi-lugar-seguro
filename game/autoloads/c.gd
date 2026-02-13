@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMel := preload("res://game/characters/mel/character_mel.gd")
# ---- classes

# nodes ----
var Mel: PCMel : get = get_Mel
# ---- nodes

# functions ----
func get_Mel() -> PCMel: return get_runtime_character("Mel")
# ---- functions

