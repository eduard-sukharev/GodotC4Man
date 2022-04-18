extends Area2D

func _ready():
	$AnimatedSprite.play()
	yield($AnimatedSprite, "animation_finished")
	queue_free()

