class_name Weapon
extends Node2D

signal shot(start_pos:Vector2 ,target_pos: Vector2, damage: int)
signal reloaded


func shoot() -> void:
	shot.emit()


func reload() -> void:
	reloaded.emit()
