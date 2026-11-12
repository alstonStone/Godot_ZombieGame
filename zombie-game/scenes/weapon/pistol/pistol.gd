class_name Pistol
extends Weapon


#@onready var animation_player: AnimationPlayer = $AnimationPlayer


func shoot() -> void:
	animation_player.play("shoot")
	print("shoot over write from child pistol class")
