class_name Weapon
extends Sprite2D

signal shot

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func shoot() -> void:
	animation_player.play("shoot")
	shot.emit()
