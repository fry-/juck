
extends Node2D

var init_pos_x
var init_pos_y
var tile_size = 64
var segment = load("res://segment.tscn")
var time = 0

var obstacle

func _ready():
	init_pos_x = get_viewport_rect().size.x + (2 * tile_size)
	init_pos_y = (get_viewport_rect().size.y / 2) - (1.5 * tile_size)
	var new_segment = segment.instance()
	new_segment.set_pos(Vector2(init_pos_x,0))
	pass

func _fixed_process(delta):
	time += delta
	pass