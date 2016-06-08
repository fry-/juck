
extends Node2D

var init_pos_y
var tile_size
var obstacle = preload("res://obstacle.tscn")
var colors = [Color(1,0,0), Color(0,0,1)]

func _ready():
	init_pos_y = get_parent().init_pos_y
	tile_size = get_parent().tile_size
	
	randomize()
	var pick_color = randi()%2
	make_obstacle(init_pos_y,pick_color,1)
	make_obstacle(-init_pos_y,(pick_color+1)%2,2)
	pass

func make_obstacle(pos_y,color_id,layer):
	add_child(obstacle.instance())
	var num = get_child_count()-1
	print(num)
	get_child(num).set_pos(Vector2(0,pos_y))
	get_child(num).get_child(1).set_modulate(colors[color_id])
	get_child(num).get_child(0).set_layer_mask(layer)
	pass
