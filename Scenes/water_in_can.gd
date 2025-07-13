extends ProgressBar

signal watering_can_empty
signal watering_can_filled


func _on_garden_plot_garden_watered() -> void:
	if value > min_value:
		value -= 25.0


func _on_garden_plot_2_garden_watered() -> void:
	if value > min_value:
		value -= 25.0


func _on_garden_plot_3_garden_watered() -> void:
	if value > min_value:
		value -= 25.0


func _on_garden_plot_4_garden_watered() -> void:
	if value > min_value:
		value -= 25.0


func _on_well_watering_can_refiled() -> void:
	value = max_value
	emit_signal("watering_can_filled")
	print("watering can refilled")


func _on_value_changed(value: float) -> void:
	if value == min_value:
		emit_signal("watering_can_empty")
		print("watering can empty")
