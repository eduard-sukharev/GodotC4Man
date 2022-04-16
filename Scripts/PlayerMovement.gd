extends AbstractMovement

class_name PlayerMovement

export var velocity = Vector2.ZERO
export var speed = 200
export var friction = 0.4
export var acceleration = 0.2

func move(subject: KinematicBody2D, delta: float):
	var input = Vector2.ZERO
	input.x =  int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y =  int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	if input.length() > 0:
		velocity = lerp(velocity, input.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	
	subject.move_and_slide(velocity)

