extends Control
var starting := false
func _ready() -> void:
	pass

func _process(_delta) -> void:
	if Input.is_action_just_pressed(&"game_start") and not starting:
		starting = true
		$Label2/AnimationPlayer.play(&"Start")
		await get_tree().create_timer(1.0).timeout
		modulate.v = .6
		await get_tree().create_timer(.3).timeout
		$Label2.visible = false
		modulate.v = .3
		await get_tree().create_timer(.3).timeout
		modulate.v = 0
		await get_tree().create_timer(1.0).timeout
		get_parent().loadScene(&"Player/HUD")
