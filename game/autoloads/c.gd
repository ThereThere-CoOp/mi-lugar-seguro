@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMel := preload("res://game/characters/mel/character_mel.gd")
const PCNarrator := preload("res://game/characters/narrator/character_narrator.gd")
# ---- classes

# nodes ----
var Mel: PCMel : get = get_Mel
var Narrator: PCNarrator : get = get_Narrator
# ---- nodes

# functions ----
func get_Mel() -> PCMel: return get_runtime_character("Mel")
func get_Narrator() -> PCNarrator: return get_runtime_character("Narrator")
# ---- functions

