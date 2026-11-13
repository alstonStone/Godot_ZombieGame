class_name EquipedWeapon
extends Weapon

var current_weapon: Weapon = null
const PISTOL = preload("uid://5a2jyy42ixwp")

func _ready() -> void:
	var new_pistol = PISTOL.instantiate() as Pistol
	current_weapon = new_pistol
	add_child(new_pistol)



func shoot() -> void:
	if current_weapon != null:
		current_weapon.shoot()
