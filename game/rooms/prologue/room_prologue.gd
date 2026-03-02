@tool
extends PopochiuRoom

const Data := preload('room_prologue_state.gd')

var state: Data = load("res://game/rooms/prologue/room_prologue.tres")

@onready var chapter_label: Label = %ChapterLabel

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	R.Prologue.hide_gui = true


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	await C.Narrator.say("Esta es una pequeña historia")
	await C.Narrator.say("La historia de una chica llamada Mel")
	await C.Narrator.say("Mel es muy hermosa y muy inteligente")
	await C.Narrator.say("Tiene grandes dotes para el arte y se le da muy bien la cocina")
	await C.Narrator.say("Es muy soñadora y cariñosa con sus seres queridos")
	await C.Narrator.say("Vive con Ed, su esposo y con sus dos mascotas, Lufi y Sauron")
	await C.Narrator.say("Es muy soñadora y cariñosa con sus seres queridos")
	await C.Narrator.say("Y asi comienza otra dia...")
	
	await E.wait(1.5)
	chapter_label.text = "TEMPRANO EN LA MAÑANA..."
	await E.wait(1.5)
	R.goto_room("BedRoom")


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
