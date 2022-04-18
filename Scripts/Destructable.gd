extends AbstractDestructable

class_name Destructable

export var hp = 1

func take_damage(subject: Node2D, impact_object: CollisionObject = null):
	print('Crack!')
	hp -= 1
	
	if hp <= 0:
		emit_signal("is_destroyed")
