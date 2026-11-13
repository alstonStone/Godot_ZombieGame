class_name Pistol
extends Weapon

var damage: int = 1
var fire_rate: float = 6.0 # shots per second
var max_fire_rate: float = 6.0 # max rate so animation works
var reload_rate: float = 1.0
var max_bullets: int = 12
var can_shoot: bool = true
@onready var bullets_left: int = max_bullets
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var fire_rate_timer: Timer = $FireRateTimer


func _ready() -> void:
	fire_rate_timer.wait_time = 1.0 / fire_rate


func shoot() -> void:
	if bullets_left > 0 and can_shoot:
		bullets_left -= 1
		can_shoot = false
		fire_rate_timer.start()
		animation_player.play("shoot",-1,fire_rate)
		shot.emit()
		print("shoot over write from child pistol class")
	else:
		animation_player.queue("empty")


func reload() -> void:
	can_shoot = false
	fire_rate_timer.stop()
	bullets_left = max_bullets
	animation_player.play("reload")
	reloaded.emit()


func _on_fire_rate_timer_timeout() -> void:
	can_shoot = true

func set_can_shoot_true() -> void:
	can_shoot = true
	
