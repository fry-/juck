
extends Node2D

var init_pos_y
var tile_size
var total_time
var obstacle = preload("res://obstacle.tscn")
var colors = [Color(1,0,0), Color(0,0,1)]

func _ready():
	init_pos_y = get_parent().init_pos_y
	tile_size = get_parent().tile_size
	total_time = get_parent().total_time
	
	randomize()
	var pick_color = randi()%2
	make_obstacle(init_pos_y,pick_color)
	make_obstacle(-init_pos_y,(pick_color+1)%2)
	
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if get_child_count() == 0:
		queue_free()
	for child in get_children():
		child.move(Vector2(-5*(1 + total_time/30),0))
		if child.get_global_pos().x < (-2 * tile_size):
			child.queue_free()
	
	pass

func make_obstacle(pos_y,color_id):
	add_child(obstacle.instance())
	var num = get_child_count()-1
	get_child(num).set_pos(Vector2(0,pos_y))
	if pos_y > 0:
		get_child(num).set_scale(Vector2(1,-get_child(num).get_scale().y))
	get_child(num).get_child(1).set_modulate(colors[color_id])
	var layer
	if color_id == 0:
		layer = 1
	else:
		layer = 2
	get_child(num).set_layer_mask(layer)
	pass
