
extends Node2D

var segment = preload("res://scenes/segment.tscn")
var color_changer = preload("res://scenes/color_changer.tscn")
var new_segment
var segment_counter = 0

var time = 0
var total_time = 0
var game_speed = 1
var frequency = 0.5 #with smaller frequency, obstacles occurence and jump/duck speed rises
var frequency_gap
var seconds = 0

export var lifes = 3

var obstacle

const tile_size = 64
onready var rand_time = randf()
onready var offset = get_viewport_rect().size.y / 4
onready var init_pos_x = get_viewport_rect().size.x + (2 * tile_size)
onready var init_pos_y = (get_viewport_rect().size.y / 2) - tile_size - offset

func _ready():
	get_node("hud/lifes").set_text(str(lifes))
	add_segment()
	set_fixed_process(true)

func _fixed_process(delta):
	if game_speed < 2:
		game_speed = 1 + total_time/180
	OS.set_time_scale(game_speed)
	total_time += delta
	time += delta
	var fire_time = total_time / 20
	if fire_time < rand_time:
		frequency_gap = rand_time/fire_time
	else:
		frequency_gap = pow(rand_time,2)
	if time - 1 + frequency > (frequency_gap):
		time = 0
		rand_time = randf()
		if segment_counter > 10 and rand_time < 0.1:
			segment_counter = 0
			new_segment = color_changer.instance()
			add_child(new_segment)
			get_child(get_child_count()-1).set_pos(Vector2(init_pos_x,get_viewport_rect().size.y/4))
		else:
			add_segment()
	
func add_segment():
	segment_counter += 1
	new_segment = segment.instance()
	add_child(new_segment)
	get_child(get_child_count()-1).set_pos(Vector2(init_pos_x,get_viewport_rect().size.y/2 - offset))
	
func life_remove():
	if lifes > 0:
		lifes -= 1
	else:
		get_node("player").set_pos(Vector2(0,-500))
		get_node("game_over").start()
	
	get_node("hud/lifes").set_text(str(lifes))
	

func _on_game_over_timeout():
	get_tree().reload_current_scene()


func _on_life_add_timeout():
	lifes += 1
	get_node("hud/lifes").set_text(str(lifes))


func _on_timer_timeout():
	if lifes > 0:
		seconds += 1
		get_node("hud/seconds").set_text(str(seconds))


func _on_main_menu_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
