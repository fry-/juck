
extends Node2D

var init_pos_x
var init_pos_y
var tile_size = 64
var segment = preload("res://segment.tscn")
var time = 0

var obstacle

func _ready():
	init_pos_x = get_viewport_rect().size.x + (2 * tile_size)
	init_pos_y = (get_viewport_rect().size.y / 2) - (1.5 * tile_size)
	var new_segment = segment.instance()
	add_child(new_segment)
	get_child(0).set_pos(Vector2(get_viewport_rect().size.x-1.5*tile_size,get_viewport_rect().size.y/2))
	pass

func _fixed_process(delta):
	time += delta
	pass