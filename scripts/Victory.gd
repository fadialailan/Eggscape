extends Light2D

export var next_scene:PackedScene

func _ready() -> void:
	MasterPlayer.stream = preload("res://music/victory.wav")
	MasterPlayer.volume_db = -20
	MasterPlayer.play()

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		var _err = get_tree().change_scene_to(next_scene)
