extends Node2D

var title:TextureButton
var quit:TextureButton

func _ready() -> void:
	title = get_node("CanvasLayer/Control/Title Button")
	quit = get_node("CanvasLayer/Control/Quit Button")

func _on_Title_Button_pressed() -> void:
	var _err = get_tree().change_scene("res://Scenes/Title.tscn")

func _on_Quit_Button_pressed() -> void:
	get_tree().quit(0)
