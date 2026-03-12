extends PopochiuCharacterData
# Put here variables you want to save and load when saving and loading the game.
# By default only Godot's basic built-in types are automatically saved and loaded
# but you can use the save_custom and load_custom methods to implement your
# own.
# script_name and scene variables from the inherited class will not be saved.

var relationship_level = 0

var current_stage: int = GameConstants.StageChoice.HOME
#####################################################################################
## puzzles variables
####################################################################################
var examined_bedroom_family_canvas: bool = false

####################################################################################
## cutscenes variables
####################################################################################
## where Mel will go today
## could be to the "pool" or to "work"
var chosen_day_schedule: int = GameConstants.DayScheduleChoice.POOL
var despertar_cutscene_watched: bool = true

#region Virtual ####################################################################################
# Use this to save custom data for this PopochiuCharacter when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion

func increase_relationship_level(value: int) -> void:
	relationship_level += value
	await C.player.play_relationship_up_cue()
