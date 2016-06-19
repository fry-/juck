
extends KinematicBody2D

var tile_size
var collision_counter = 0
var player

func _ready():
	player = get_parent().get_parent().get_node("player")
	tile_size = get_parent().tile_size
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if get_global_pos().x < (-5 * tile_size):
		queue_free()
	move(Vector2(-1,0) * global.MOTION_SPEED * delta)
	
	if is_colliding():
		player.colliding = true
	pass
