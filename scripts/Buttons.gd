extends Area2D

#signals
signal press

#nodes
var sprite:Sprite

#vars
var pressed:bool = false

func _ready() -> void:
	sprite = get_node("Sprite")
	pass


func _on_Buttons_area_entered(area: Area2D) -> void:
	if area.is_in_group("player core area"):
		if pressed == false:
			MasterPlayer.stream = preload("res://music/klick.wav")
			MasterPlayer.volume_db = -5
			MasterPlayer.play()
			emit_signal("press")
			pressed = true
			sprite.frame = 1
