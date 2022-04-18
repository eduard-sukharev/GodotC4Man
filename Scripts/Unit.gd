extends KinematicBody2D

export var velocity = Vector2.ZERO
export var speed = 200
export var friction = 0.4
export var acceleration = 0.2

onready var bomb: PackedScene = load("res://Bomb.tscn")

func _physics_process(delta):	
#	look_at(get_global_mouse_position())
	$Behaviors/Movable.move(self, delta)
	
	if Input.is_action_just_pressed("ui_accept"):
		$Behaviors/Spawner.spawn(self, bomb)
