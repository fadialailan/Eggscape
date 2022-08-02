extends RigidBody2D

var speed:float = 250
var imp:float

export var movement:bool = true

var timer:Timer

func _ready() -> void:
	imp = speed * mass
	

func _integrate_forces(_state: Physics2DDirectBodyState) -> void:
	if not movement or mode == RigidBody2D.MODE_STATIC:
		return
	if(Input.is_action_just_pressed("ui_right")):
		add_central_force(Vector2(imp,0))
	if (Input.is_action_just_released("ui_right")):
		add_central_force(Vector2(-imp,0))
	if(Input.is_action_just_pressed("ui_left")):
		add_central_force(Vector2(-imp,0))
	if (Input.is_action_just_released("ui_left")):
		add_central_force(Vector2(imp,0))
	

func setup():
	if not movement:
		return
	var force:Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		force.x = imp
	elif Input.is_action_pressed("ui_left"):
		force.x = -imp
	
	applied_force = force


func spring_collison() -> void:
	MasterPlayer.stream = preload("res://music/spring.wav")
	MasterPlayer.volume_db = -20
	MasterPlayer.play()
	apply_central_impulse(Vector2(-linear_velocity.x*mass/2,-500
	-abs(linear_velocity.x)))

func _on_Timer_timeout() -> void:
	var force:Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		force.x = imp
	elif Input.is_action_pressed("ui_left"):
		force.x = -imp
	applied_force = force


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		$AnimationPlayer.play("Normal")


func _on_death_area_entered(area: Area2D) -> void:
	if area.is_in_group("player core area"):
		$AnimationPlayer.play("death")
		var death:Area2D = get_tree().get_nodes_in_group("death area")[0]
		death.get_child(0).set_deferred("disabled",true)

func show_mes()->void:
	var mes:AnimationPlayer = get_tree().get_nodes_in_group("mes player")[0]
	mes.play("show")


func show_di()->void:
	var mes:Sprite = get_tree().get_nodes_in_group("di")[0]
	mes.visible = true
	
	$AnimationPlayer.play("Normal")
	


