class_name Player
extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var weapon_pivot: Marker2D = $WeaponPivot
@onready var equiped_weapon: EquipedWeapon = $WeaponPivot/EquipedWeapon
@onready var player_sprite: Sprite2D = $PlayerSprite


@export var speed: int = 5000





func _process(delta: float) -> void:
	#if state != State.Dying:
	if Input.is_action_pressed("shoot"):
		shoot()
	var direction := Input.get_vector("move_left","move_right","move_up","move_down").normalized()
	velocity = direction * speed * delta
	move_and_slide()
	play_moving_animation(direction)
	aim_at(get_global_mouse_position())
	#attract_coins(delta)



func play_moving_animation(direction: Vector2) -> void:
		#if state == State.Moving:
			if direction != Vector2.ZERO :
				animation_player.play("run")
			else:
				animation_player.play("idle")

func aim_at(target: Vector2) -> void:
	var weapon_direction := weapon_pivot.global_position.direction_to(target)
	weapon_pivot.rotation = weapon_direction.angle()
	if target.x < global_position.x :
		weapon_pivot.scale.y = -1
		player_sprite.flip_h = false
	else:
		weapon_pivot.scale.y = 1
		player_sprite.flip_h = true

func shoot() -> void:
	var weapon:= equiped_weapon.current_weapon
	if  weapon != null and weapon is Weapon:
		weapon.shoot()
