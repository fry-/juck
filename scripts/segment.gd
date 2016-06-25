
extends Node2D

var obstacle = preload("res://scenes/obstacle.tscn")
var colors = [Color(1,0,0), Color(0,0,1)]
const MOTION_SPEED = 400

onready var init_pos_y = get_parent().init_pos_y
onready var tile_size = get_parent().tile_size

func _ready():
	randomize()
	var make_id = randi()%2
	print(make_id)
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