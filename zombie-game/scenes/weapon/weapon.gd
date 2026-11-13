class_name Weapon
extends Node2D

signal shot
signal reloaded


func shoot() -> void:
	shot.emit()


func reload() -> void:
	reloaded.emit()
