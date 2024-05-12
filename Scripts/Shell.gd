extends Node
var childPath := ^""

func _ready():
	loadScene("Menu")

func loadScene(sceneName: String):
	if not childPath.is_empty():
		get_node(childPath).queue_free()
	var scene:PackedScene = load(str("res://Scenes/", sceneName, ".tscn"))
	if scene:
		var child := scene.instantiate()
		add_child(child)
		childPath = get_path_to(child)
