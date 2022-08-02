extends Node2D

export var level_1:String

var credits:Control
var world:Environment
var sound1:AudioStreamPlayer
var sound2:AudioStreamPlayer

func _ready() -> void:
	credits = get_node("CanvasLayer/Credits")
	credits.visible = false
	world =  get_node("WorldEnvironment").environment
	sound1 = get_node("tick")
	sound2 = get_node("knock")
	
	

func _on_Start_button_pressed() -> void:
	sound2.play(0)
	var _err = get_tree().change_scene(level_1)

func _on_quit_button_pressed() -> void:
	sound2.play(0)
	get_tree().quit(0)

func _on_credits_button_pressed() -> void:
	sound2.play(0)
	world.dof_blur_near_enabled = true
	credits.visible = true


func _on_TextureButton_pressed() -> void:
	sound2.play(0)
	world.dof_blur_near_enabled = false
	credits.visible = false


func _on_tick_finished() -> void:
	sound1.play(0)
	pass # Replace with function body.
