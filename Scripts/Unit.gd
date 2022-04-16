extends KinematicBody2D

export var velocity = Vector2.ZERO
export var speed = 200
export var friction = 0.4
export var acceleration = 0.2

func _ready():
	pass # Replace with function body.


func get_input():
	var input = Vector2.ZERO
	input.x =  int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y =  int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	
	look_at(get_global_mouse_position())
	velocity = move_and_slide(velocity)
