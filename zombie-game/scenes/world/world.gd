class_name World
extends Node2D

const BULLET = preload("uid://dnjxb40udq21v")

func _on_player_shot(start_pos:Vector2 ,target_pos: Vector2, damage: int) -> void:
	var direction: Vector2 = start_pos.direction_to(target_pos).normalized()
	var new_bullet: Bullet = BULLET.instantiate() as Bullet
	new_bullet.global_position = start_pos
	new_bullet.direction = direction
	new_bullet.rotation = direction.angle()
	new_bullet.damage = damage
	add_child(new_bullet)
	print("we get here")
	pass 
