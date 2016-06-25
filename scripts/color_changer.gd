
extends KinematicBody2D

onready var player = get_parent().get_node("player")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	move(Vector2(-1,0) * global.MOTION_SPEED * delta)
	if is_colliding():
		queue_free()
		player.color_changing = true