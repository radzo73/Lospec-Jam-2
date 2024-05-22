extends Node2D
class_name BaseEnemy
var health := 1
var speedY := 0.0
var score := 0

func _process(delta):
	self.position.y += speedY * delta

func takeDamage(damage :int, knockback :int) -> void:
	health -= damage
	if health <= 0 and visible:
		visible = false
		var explosion :AnimatedSprite2D = load("res://Scenes/VFX/Explosion.tscn").instantiate()
		get_parent().get_parent().updateScore(score)
		explosion.duration = 1.0
		get_parent().add_child(explosion)
		explosion.global_position = global_position
		queue_free()
		return
	position.y -= knockback

func dealHit(body: Node2D, damage: int):
	if get_tree().get_nodes_in_group(&"Player").has(body):
		body.takeHit(damage)
		takeDamage(1, 32)
