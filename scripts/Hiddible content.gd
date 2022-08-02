extends StaticBody2D

#exports
export var button_path:NodePath

#nodes
var button:Area2D

func _ready() -> void:
	if button_path:
		button = get_node(button_path)
		var _err = button.connect("press",self,"disapear")

func disapear():
	var children:Array = get_children()
	for x in children:
		if x is CollisionShape2D:
			x.set_deferred("disabled",true)
	visible = false
