"""
Utility functions to calculate steering motion
To use as an autoloaded Node
"""
extends Node

const DEFAULT_MASS: = 2.0
const DEFAULT_SLOW_RADIUS: = 200.0
const DEFAULT_MAX_SPEED: = 400.0
const DEFAULT_DISTANCE_THRESHOLD: = 3.0
const DEFAULT_OFFSET: = 100


static func follow(
		velocity: Vector2,
		global_position: Vector2,
		target_position: Vector2,
		max_speed: = DEFAULT_MAX_SPEED,
		mass: = DEFAULT_MASS
	) -> Vector2:
	"""
	Calculates and returns a velocity steering towards target_position
	"""
	var desired_velocity: Vector2 = (target_position - global_position).normalized() * max_speed
	var steering: Vector2 = (desired_velocity - velocity) / mass
	return velocity + steering


static func arrive_to(
		velocity: Vector2,
		global_position: Vector2,
		target_position: Vector2,
		max_speed: = DEFAULT_MAX_SPEED,
		slow_radius: = DEFAULT_SLOW_RADIUS,
		mass: = DEFAULT_MASS
	) -> Vector2:
	"""
	Calculates and returns a new velocity with the arrive steering behavior
	"""
	var to_target: = global_position.distance_to(target_position)
	var desired_velocity: = (target_position - global_position).normalized() * max_speed
	if to_target < slow_radius:
		desired_velocity *= (to_target / slow_radius) * .75 + .25
	var steering: Vector2 = (desired_velocity - velocity) / mass
	return velocity + steering

static func follow_at_distance(
		velocity: Vector2,
		global_position: Vector2,
		target_position: Vector2,
		follow_offset: = DEFAULT_OFFSET,
		distance_threshold: = DEFAULT_DISTANCE_THRESHOLD,
		max_speed: = DEFAULT_MAX_SPEED,
		slow_radius: = DEFAULT_SLOW_RADIUS,
		mass: = DEFAULT_MASS
	) -> Vector2:
	"""
	Calculates and returns a new velocity with the arrive at distance steering behavior
	"""	
	var to_target: = global_position.distance_to(target_position)
	
	if to_target < distance_threshold:
		return Vector2.ZERO
	
	var follow_position : Vector2 = (
		target_position - (target_position - global_position).normalized() * follow_offset
		if to_target > follow_offset
		else global_position
	)
	
	return Steering.arrive_to(
		velocity,
		global_position,
		follow_position,
		max_speed,
		slow_radius,
		mass
	)
