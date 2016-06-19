
extends KinematicBody2D

var jump_button
var duck_button
var anim_node
var current_anim
var frequency
var current_color
var color_changing = false
var colliding = false
var current_time = -2

func _ready():
	randomize()
	current_color = randi()%2
	change_color(self)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	jump_button = Input.is_action_pressed("jump")
	#if jump_button == true:
		#print("jump pressed")
	duck_button = Input.is_action_pressed("duck")
	anim_node = get_node("animation")
	current_anim = anim_node.get_current_animation()
	frequency = 1/get_parent().frequency
	
	#if current_anim == "run":
	if jump_button and current_anim == "run":
		#print("jumping")
		anim_node.set_current_animation("jump")
		anim_node.set_speed(frequency*1.1)
	elif duck_button and current_anim == "run":
		anim_node.set_current_animation("duck")
		anim_node.set_speed(frequency*1.1)
	elif current_anim == "run":
		anim_node.set_speed(1)
	
	if color_changing == true:
		color_changing = false
		current_color = (current_color+1)%2
		change_color(self)
	
	if colliding == true:
		print("1")
		colliding = false
		current_time = get_parent().total_time
		set_opacity(0.5)
		set_one_way_collision_direction(Vector2(-1,0))
		set_collision_mask(3)
	elif (get_one_way_collision_direction() == Vector2(-1,0)) and ((current_time + 0.4) < get_parent().total_time):
		print("2")
		set_one_way_collision_direction(Vector2(0,0))
	elif (current_time > 0) and ((current_time + 1) < get_parent().total_time):
		print("3")
		current_time = -2
		set_opacity(1)
		set_collision_mask(global.layer[current_color]) # set the mask for collision

func change_color(node):
	for child in node.get_children():
		print(child.get_type())
		if child.get_child_count() > 0 and child.get_type() == "Sprite":
			change_color(child)
			child.set_modulate(global.colors[current_color])
	set_collision_mask(global.layer[current_color]) # set the mask for collision
	print("player: ",get_collision_mask())
