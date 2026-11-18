class_name EquipedWeapon
extends Node2D

signal shot(start_pos:Vector2 ,target_pos: Vector2, damage: int)

var current_weapon: Weapon = null
const PISTOL = preload("uid://5a2jyy42ixwp")

func _ready() -> void:
	var new_pistol = PISTOL.instantiate() as Pistol
	current_weapon = new_pistol
	current_weapon.shot.connect(weapon_shot)
	add_child(new_pistol)



func shoot() -> void:
	if current_weapon != null:
		current_weapon.shoot()

func weapon_shot(start_pos:Vector2 ,target_pos: Vector2, damage: int) -> void:
	shot.emit(start_pos,target_pos,damage)
	print(str(start_pos)+" : "+str(target_pos)+" : "+str(damage))
