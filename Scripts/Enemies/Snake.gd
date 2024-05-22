extends BaseEnemy

func _ready():
	health = 2
	speedY = 10
	score = 100

func _on_area_2d_body_entered(body: Node2D):
	dealHit(body, 1)
	

func _on_area_2d_area_entered(area: Area2D):
	if get_tree().get_nodes_in_group(&"Player/Bullet").has(area):
		takeDamage(area.get_parent().damage, 16)
		area.get_parent().queue_free()
