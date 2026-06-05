class_name NPCBehavior
extends Node

@export var character: String = "Ed"

@export var behavior: GameConstants.NPCBehaviorChoice = GameConstants.NPCBehaviorChoice.STATIC

@export var idle_animations: Array[String] = ["idle"]

@export var walking_point_suffix: String = "WalkEd"

@export var _walking_markers: Array[Marker2D] = []

@export var waiting_range: Vector2 = Vector2(1, 10)

@onready var _timer = %Timer

var _character: PopochiuCharacter

var _last_selected_waling_marker_name: String = ""

var current_state: GameConstants.NPCBehaviorStateChoice = GameConstants.NPCBehaviorStateChoice.IDLE
# Called when the node enters the scene tree for the first time.

func _get_walk_points() -> void:
	# if is_random_walking:
	_walking_markers = []
	var markers = R.current.get_markers()
	
	for marker: Marker2D in markers:
		if marker.name.begins_with(walking_point_suffix):
			_walking_markers.append(marker)
			
			
func _setup_timer() -> void:
	_timer.wait_time = randf_range(waiting_range.x, waiting_range.y)
	_timer.start()


func setup() -> void:
	_character = C.get_character(character)
	_get_walk_points()
	_setup_timer()
	
func _ready() -> void:
	pass # Replace with function body.


func _handle_random_idle() -> void:
	current_state = GameConstants.NPCBehaviorStateChoice.IDLE
	var idle_index = randi_range(0, len(idle_animations) -  1)
	_character.play_animation(idle_animations[idle_index])
	
	
func _handle_behavior():
	match behavior:
		GameConstants.NPCBehaviorChoice.STATIC:
			_handle_random_idle()
		
		GameConstants.NPCBehaviorChoice.RANDOM_WALKING:
			var idle_or_walk = randf_range(0,1)
			if idle_or_walk < 0.5:
				_handle_random_idle()
			else:
				# is gonna walk baby
				
				if len(_walking_markers) > 0:
					if behavior == GameConstants.NPCBehaviorChoice.RANDOM_WALKING:
						var index = randi_range(0, len(_walking_markers) - 1)
						var selected_marker = _walking_markers[index]
						
						while selected_marker.name == _last_selected_waling_marker_name:
							index = randi_range(0, len(_walking_markers) - 1)
							selected_marker = _walking_markers[index]
						
						_last_selected_waling_marker_name = selected_marker.name
						current_state = GameConstants.NPCBehaviorStateChoice.WALKING
						await _character.walk_to_marker(selected_marker.name)
						current_state = GameConstants.NPCBehaviorStateChoice.IDLE

func stop() -> void:
	_character.stop_walking()
		
	if _character.current_animation != "idle":
		_character.idle()
	
func _on_timer_timeout() -> void:
	if current_state == GameConstants.NPCBehaviorStateChoice.IDLE:
		_handle_behavior()
