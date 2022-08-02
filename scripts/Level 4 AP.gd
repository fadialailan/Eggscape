extends AnimationPlayer

func _ready() -> void:
	pass


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("player core area"):
		pass
