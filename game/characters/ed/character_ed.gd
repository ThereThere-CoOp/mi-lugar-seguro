@tool
extends PopochiuCharacter
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the execution of
# the function until the sequence of events finishes.

@export var is_random_walking: bool = false

@export var walking_markers: Array[Marker2D] = []

@export var waiting_range: Vector2 = Vector2(1, 10)

const Data := preload('character_ed_state.gd')

var state: Data = load("res://game/characters/ed/character_ed.tres")

@onready var _walking_timer = %RandomWalkingTimer

var _is_random_walking_disabled = false

var _last_selected_waling_marker_name: String = ""

func _get_walk_points() -> void:
	# if is_random_walking:
	walking_markers = []
	var markers = R.current.get_markers()
	
	for marker: Marker2D in markers:
		if marker.name.begins_with("WalkEd"):
			walking_markers.append(marker)
				
				
func _handle_random_walking():
	if len(walking_markers) > 0:
		if is_random_walking and not _is_random_walking_disabled:
			var index = randi_range(0, len(walking_markers) - 1)
			var selected_marker = walking_markers[index]
			
			while selected_marker.name == _last_selected_waling_marker_name:
				index = randi_range(0, len(walking_markers) - 1)
				selected_marker = walking_markers[index]
			
			_last_selected_waling_marker_name = selected_marker.name
			await walk_to_marker(selected_marker.name)


func _setup_walking_timer() -> void:
	_walking_timer.stop()
	_walking_timer.wait_time = randf_range(waiting_range.x, waiting_range.y)
	_walking_timer.start()
	
	
#region Virtual ####################################################################################
# When the room in which this node is located finishes being added to the tree
func _on_room_set() -> void:
	_get_walk_points()
	_setup_walking_timer()


# When the node is clicked
func _on_click() -> void:
	_is_random_walking_disabled = true
	C.Ed.stop_walking()
	_walking_timer.stop()
	C.player.face_clicked()
	C.Ed.face_direction(C.player.look_at_point)
	
	await D.EdDialog.start()
	
	_is_random_walking_disabled = false
	_setup_walking_timer()


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this character and then say something:
#	await C.player.face_clicked()
#	await C.player.say("Is someone...")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# character. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("I don't want to give up my key")


# Use it to play the idle animation for the character
func _play_idle() -> void:
	super()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func _play_walk(target_pos: Vector2) -> void:
	super(target_pos)


# Use it to play the talk animation for the character
func _play_talk() -> void:
	super()


# Use it to play the grab animation for the character
func _play_grab() -> void:
	super()


# Called when the character starts moving
func _on_movement_started() -> void:
	_is_random_walking_disabled = true


# Called when the character stops moving
func _on_movement_ended() -> void:
	_is_random_walking_disabled = false
	_setup_walking_timer()


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion

func _process(delta: float) -> void:
	super(delta)
		


func _on_random_walking_timer_timeout() -> void:
	_handle_random_walking()
