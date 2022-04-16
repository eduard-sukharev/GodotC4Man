extends KinematicBody2D

export var velocity = Vector2.ZERO
export var speed = 200
export var friction = 0.4
export var acceleration = 0.2

onready var movement : AbstractMovement = PlayerMovement.new()
	
func _physics_process(delta):	
#	look_at(get_global_mouse_position())
	movement.move(self, delta)
