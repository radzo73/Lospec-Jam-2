extends CharacterBody2D
@export var HUD: NodePath
@export var speedUp := 0.5
@export var speedDown := 1.0
@export var speedHorizontalTerm := 100.0
@export var speedHorizontalAccel := 20


func _process(delta):
	var left := Input.is_action_pressed(&"game_left")
	var right := Input.is_action_pressed(&"game_right")
	var up := Input.is_action_pressed(&"game_up")
	if left and not right:
		velocity.x = move_toward(velocity.x, -speedHorizontalTerm, speedHorizontalAccel)
	elif right and not left:
		velocity.x = move_toward(velocity.x, speedHorizontalTerm, speedHorizontalAccel)
	else:
		velocity.x = move_toward(velocity.x, 0, speedHorizontalAccel)
	if Global.moveVertical:
		if up:
			velocity.y = 0
	
	move_and_slide()
