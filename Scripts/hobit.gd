extends CharacterBody2D

@export var speed = 300

var can_use_watering_can: bool = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _physics_process(_delta):
	get_input()
	move_and_slide()


func _on_water_in_can_watering_can_empty() -> void:
	can_use_watering_can = false


func _on_water_in_can_watering_can_filled() -> void:
	can_use_watering_can = true
