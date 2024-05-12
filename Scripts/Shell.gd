extends Node
var child := Node.new()

func _ready():
	loadScene("Menu")

func loadScene(sceneName: String):
	if not child.get_parent():
		child.queue_free()
	var scene:PackedScene = load(str("res://Scenes/", sceneName, ".tscn"))
	child = scene.instantiate()
	self.call_deferred(&"add_child", child)
