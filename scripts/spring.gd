extends Area2D

#signals
signal spring

#nodes
var player:RigidBody2D
var sprite:Sprite
var timer:Timer
var collision_shape:CollisionShape2D

#vars
var sprung:bool = false

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	sprite = get_node("springs")
	timer = get_node("Timer")
	collision_shape = get_node("CollisionShape2D")
	var _err = connect("spring",player,"spring_collison")
	pass


func _on_spring_area_entered(area: Area2D) -> void:
	if area.is_in_group("player core area"):
		sprung = true
		sprite.frame = 1
		set_deferred("collision_shape.disabled",true)
		timer.start(1)
		emit_signal("spring")


func _on_Timer_timeout() -> void:
	sprung = false
	sprite.frame = 0
	set_deferred("collision_shape.disabled",false)
