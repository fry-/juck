
extends Node2D

var init_pos_x
var init_pos_y
var tile_size = 64
var segment = preload("res://segment.tscn")
var new_segment
var rand_time
var time = 0
var total_time = 0

var obstacle

func _ready():
	init_pos_x = get_viewport_rect().size.x + (2 * tile_size)
	init_pos_y = (get_viewport_rect().size.y / 2) - tile_size
	add_segment()
	
	rand_time = randf()
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	total_time += delta
	time += delta
	var fire_time = total_time / 20
	if time + 0.5 > ((rand_time+fire_time)/fire_time):
		print("fire")
		time = 0
		rand_time = randf()
		add_segment()
	pass
	
func add_segment():
	new_segment = segment.instance()
	add_child(new_segment)
	get_child(get_child_count()-1).set_pos(Vector2(init_pos_x,get_viewport_rect().size.y/2))