extends Sprite2D

var speed := 128
var damage := 1

func _process(delta):
	position.y -= speed * delta
