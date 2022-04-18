extends Node2D

onready var bomb: PackedScene = load("res://Shockwave.tscn")

func _ready():
	$AnimatedSprite.play()

func spawn_shockwave():
	$Behaviors/Spawner.spawn(self, bomb)
	print('Whooosh!')
	pass

func on_destruction():
	print('Boom!')
	spawn_shockwave()
	
	$AnimatedSprite.play('die')
	yield($AnimatedSprite, 'animation_finished')
	
	queue_free()



func _on_Timer_timeout():
	$Behaviors/Destructable.take_damage(self)
