extends Area2D

var is_garden_watered: bool = false
var can_water_garden: bool = false

signal garden_watered

@onready var dry_texture = load("res://Assets/dirt.png")
@onready var watered_texture = load("res://Assets/dirt_watered.png")


func _process(_delta: float) -> void:
	if can_water_garden and !is_garden_watered and Input.is_action_just_pressed("interact"):
		water_garden()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Hobit" and body.can_use_watering_can:
		can_water_garden = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Hobit":
		can_water_garden = false


func _on_timer_until_dry_timeout() -> void:
	$Sprite2D.texture = dry_texture
	is_garden_watered = false
	print("garden plot is dry")


func water_garden() -> void:
	is_garden_watered = true
	$Sprite2D.texture = watered_texture
	$TimerUntilDry.start()
	emit_signal("garden_watered")
		
	print("garden plot is watered")
