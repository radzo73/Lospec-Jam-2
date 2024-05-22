extends CharacterBody2D
@export var speedUp := 0.5
@export var speedDown := 1.0
@export var speedHorizontalTerm := 100.0
@export var speedHorizontalAccel := 20

var health := 3
var stayinboundsY := false
var wrapX := true
var freeze := true
var invulnerable := false

func _ready():
	get_parent().setHealth(health)

func _process(_delta):
	var left := Input.is_action_pressed(&"game_left")
	var right := Input.is_action_pressed(&"game_right")
	if left and not right and not freeze and Global.moveHorizontal:
		velocity.x = move_toward(velocity.x, -speedHorizontalTerm, speedHorizontalAccel)
		$"../Background/Left/AnimationPlayer".play(&"On")
	elif right and not left and not freeze and Global.moveHorizontal:
		velocity.x = move_toward(velocity.x, speedHorizontalTerm, speedHorizontalAccel)
		$"../Background/Right/AnimationPlayer".play(&"On")
	else:
		velocity.x = move_toward(velocity.x, 0, speedHorizontalAccel)
	
	if Input.is_action_just_released(&"game_left") and Global.moveHorizontal:
		$"../Background/Left/AnimationPlayer".play(&"Off")
	if Input.is_action_just_released(&"game_right") and Global.moveHorizontal:
		$"../Background/Right/AnimationPlayer".play(&"Off")
	move_and_slide()
	if stayinboundsY:
		position.y = clampf(position.y, 8, 184)
	if wrapX:
		if position.x < -8:
			position.x = 264
		if position.x > 264:
			position.x = -8

func shoot() -> void:
	var bullet:Node2D = load("res://Scenes/Player/Bullet.tscn").instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = global_position

func takeHit(damage: int) -> void:
	if not invulnerable:
		health -= damage
		get_parent().setHealth(health)
		if health <= 0:
			pass #explode and game over
		else:
			invulnerable = true
			$Sprite2D/AnimationPlayer.play("Hit")
			await $Sprite2D/AnimationPlayer.animation_finished
			invulnerable = false
