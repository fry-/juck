
extends KinematicBody2D

var jump_button
var duck_button
var anim_node
var current_anim
var frequency
var current_color

func _ready():
	randomize()
	current_color = randi()%2
	change_color(self)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	jump_button = Input.is_action_pressed("jump")
	duck_button = Input.is_action_pressed("duck")
	anim_node = get_node("animation")
	current_anim = anim_node.get_current_animation()
	frequency = 1/get_parent().frequency
	
	if current_anim == "run":
		if jump_button:
			anim_node.set_current_animation("jump")
			anim_node.set_speed(frequency)
		elif duck_button:
			anim_node.set_current_animation("duck")
			anim_node.set_speed(frequency)
		else:
			anim_node.set_speed(1)
	
	if is_colliding():
		print("collision")

func change_color(node):
	for child in node.get_children():
		print(child.get_type())
		if child.get_child_count() > 0 and child.get_type() == "Sprite":
			change_color(child)
			child.set_modulate(global.colors[current_color])
	#set_collision_mask(global.layer[current_color]) # set the mask for collision
