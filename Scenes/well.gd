extends Area2D

var can_refil_watering_can: bool = false

signal watering_can_refiled

func _process(_delta: float) -> void:
  if can_refil_watering_can and Input.is_action_just_pressed("interact"):
    emit_signal("watering_can_refiled")

func _on_body_entered(body: Node2D) -> void:
  if not body.can_use_watering_can:
    can_refil_watering_can = true


func _on_body_exited(_body: Node2D) -> void:
  can_refil_watering_can = false
