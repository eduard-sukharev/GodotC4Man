extends AbstractSpawner

class_name AdjacentSpawner

func spawn(subject: Node2D, object: PackedScene):
	var map: TileMap = subject.get_parent()
	var tile_pos = map.world_to_map(subject.position)
	var adjacent_positions = [
		Vector2.UP,
		Vector2.DOWN,
		Vector2.LEFT,
		Vector2.RIGHT,
	]
	for pos in adjacent_positions:
		print(tile_pos + pos)
		print(map.get_cellv(tile_pos + pos))
		if map.get_cellv(tile_pos + pos) == map.INVALID_CELL:
			var new_instance = object.instance()
			new_instance.position = map.map_to_world(tile_pos + pos) + Vector2(32, 32)
			map.add_child(new_instance)
