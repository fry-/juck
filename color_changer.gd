
extends KinematicBody2D

var player

func _ready():
	player = get_parent().get_node("player")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move(Vector2(-1,0) * global.MOTION_SPEED * delta)
	if is_colliding():
		queue_free()
		player.color_changing = true
	pass # replace with function body
