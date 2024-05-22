extends Control
var childPath := ^""
var ID := 1
var score := 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 20
	loadScene(1)
	updateScore(0)
	var tween := get_tree().create_tween()
	tween.tween_property($Player, ^"position:y", 168, .5)
	await tween.finished
	$Player.stayinboundsY = true
	await $Background/AnimationPlayer.animation_finished
	$Player.freeze = false

func setHealth(health: int) -> void:
	$Background/Health.size.x = maxi(health, 0) * 8

func _process(_delta):
	if Input.is_action_pressed(&"game_A") and not $Background/Shoot/AnimationPlayer.is_playing() and not $Player.freeze:
		$Background/Shoot/AnimationPlayer.play("Shoot")
		$Player.shoot()

func loadScene(newID := 1):
	ID = newID
	if not childPath.is_empty():
		get_node(childPath).queue_free()
	var scene:PackedScene = load(str("res://Scenes/Levels/", ID, ".tscn"))
	if scene:
		var child := scene.instantiate()
		add_child(child)
		childPath = get_path_to(child)

func updateScore(sum: int):
	score += sum
	$Background/Score.text = str("SCORE: ", "%08d" %score)
