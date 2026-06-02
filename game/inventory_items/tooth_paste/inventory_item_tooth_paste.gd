extends PopochiuInventoryItem

const Data := preload('inventory_item_tooth_paste_state.gd')

var state: Data = load("res://game/inventory_items/tooth_paste/inventory_item_tooth_paste.tres")


#region Virtual ####################################################################################
# When the item is clicked in the inventory
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the item is right clicked in the inventory
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the item is middle clicked in the inventory
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the item is clicked and there is another inventory item selected
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item == I.Toothbrush:
		await C.player.say("Ahora puedo lavarme los dientes en el lavamanos")
		I.Toothbrush.remove()
		I.ToothPaste.remove()
		I.ToothbrushWithPaste.add()
	else:
		await C.player.say("No puedo usarlo de esta manera")

# Actions to execute after the item is added to the Inventory
func _on_added_to_inventory() -> void:
	# Replace the call to super() to implement your code. This only
	# makes the default behavior to happen.
	super()


# Actions to execute when the item is discarded from the Inventory
func _on_discard() -> void:
	# Replace the call to super() to implement your code. This only
	# makes the default behavior to happen.
	super()


#endregion
