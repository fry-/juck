
extends Node2D

var init_pos_y
var tile_size
var obstacle = load("res://obstacle.tscn")
var current_obstacle
var colors = [Color(1,0,0), Color(0,0,1)]

func _ready():
	var main = load("res://main.tscn")
	init_pos_y = main.init_pos_y
	tile_size = main.tile_size
	
	randomize()
	var pick_color = randi()%2
	make_obstacle(init_pos_y,pick_color,1)
	make_obstacle(-init_pos_y,(pick_color+1)%2,2)
	pass

func make_obstacle(pos_y,color_id,layer):
	current_obstacle = obstacle.instance()
	current_obstacle.set_pos(Vector2(0,pos_y))
	current_obstacle.get_child(1).set_modulate(colors[color_id])
	current_obstacle.get_child(0).set_layer_mask(layer)
	pass
