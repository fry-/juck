
extends Node2D

var init_pos_y
var tile_size
var obstacle = preload("res://obstacle.tscn")
var colors = [Color(1,0,0), Color(0,0,1)]
const MOTION_SPEED = 400

func _ready():
	init_pos_y = get_parent().init_pos_y
	tile_size = get_parent().tile_size
	
	randomize()
	var make_id = randi()%2
	make_obstacle(init_pos_y+32,make_id)
	make_obstacle(-init_pos_y,(make_id+1)%2)
	
func make_obstacle(pos_y,vector_id):
	add_child(obstacle.instance())
	var num = get_child_count()-1
	get_child(num).set_pos(Vector2(0,pos_y))
	if pos_y > 0:
		get_child(num).set_scale(Vector2(1,-0.5*get_child(num).get_scale().y))
	get_child(num).get_child(1).set_modulate(global.colors[vector_id])
	get_child(num).set_layer_mask(global.layer[vector_id]) # set obstacles layer for collision
	print("new child: ",get_child(num).get_layer_mask())
	pass
