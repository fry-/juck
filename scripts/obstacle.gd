
extends KinematicBody2D

var collision_counter = 0

onready var tile_size = get_parent().tile_size
onready var player = get_parent().get_parent().get_node("player")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if get_global_pos().x < (-5 * tile_size):
		queue_free()
	move(Vector2(-1,0) * global.MOTION_SPEED * delta)
	
	if is_colliding():
		player.colliding = true