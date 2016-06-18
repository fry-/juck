
extends KinematicBody2D

const MOTION_SPEED = 400
var tile_size
var collision_counter = 0

func _ready():
	tile_size = get_parent().tile_size
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if get_global_pos().x < (-5 * tile_size):
		queue_free()
	move(Vector2(-1,0) * MOTION_SPEED * delta)
	
	if is_colliding():
		collision_counter += 1
		print("obstacle collides: ",collision_counter)
	pass
