extends AbstractSpawner

class_name UnderSpawner

func spawn(subject: Node2D, object: PackedScene):
	var parent = subject.get_parent()
	var map: TileMap = subject.get_parent().get_node('Background')
	var new_object = object.instance()
#	print('Subject global position: ')
#	print(subject.global_position)
#	print('Subject global to map position: ')
#	print(map.world_to_map(subject.global_position))
#	print('Subject global to map to world position: ')
#	print(map.map_to_world(map.world_to_map(subject.global_position)))
	new_object.position = map.map_to_world(map.world_to_map(subject.global_position)) + Vector2(32, 32)
	parent.get_node('Destructables').add_child(new_object)
