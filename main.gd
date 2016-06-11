
extends Node2D

var init_pos_x
var init_pos_y
var offset
var tile_size = 64
var segment = preload("res://segment.tscn")
var new_segment
var rand_time
var time = 0
var total_time = 0
var frequency = 0.5 #with smaller frequency, obstacles occurence and jump/duck speed rises

var obstacle

func _ready():
	offset = get_viewport_rect().size.y / 4
	init_pos_x = get_viewport_rect().size.x + (2 * tile_size)
	init_pos_y = (get_viewport_rect().size.y / 2) - tile_size - offset
	add_segment()
	
	rand_time = randf()
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	total_time += delta
	time += delta
	var fire_time = total_time / 20
	if time - 1 + frequency > (rand_time/fire_time):
		time = 0
		rand_time = randf()
		add_segment()
	pass
	
func add_segment():
	new_segment = segment.instance()
	add_child(new_segment)
	get_child(get_child_count()-1).set_pos(Vector2(init_pos_x,get_viewport_rect().size.y/2 - offset))