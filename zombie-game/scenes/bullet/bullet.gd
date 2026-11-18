class_name Bullet
extends AnimatableBody2D


var speed := 500
var damage := 0
var direction: Vector2 = Vector2.ZERO



func _physics_process(delta: float) -> void:
	move_and_collide(direction * speed * delta)






func _on_screen_exited() -> void:
	queue_free()
