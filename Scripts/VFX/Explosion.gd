extends AnimatedSprite2D
var duration := 0.0
func _ready():
	await get_tree().create_timer(duration).timeout
	queue_free()
