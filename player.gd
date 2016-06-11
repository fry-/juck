
extends KinematicBody2D

var jump_button
var duck_button
var anim_node
var current_anim
var frequency

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	jump_button = Input.is_action_pressed("jump")
	duck_button = Input.is_action_pressed("duck")
	anim_node = get_node("animation")
	current_anim = anim_node.get_current_animation()
	frequency = get_parent().frequency
	print(frequency,"   ",1/frequency)
	
	if current_anim == "run":
		if jump_button:
			anim_node.set_current_animation("jump")
			anim_node.set_speed(1/frequency)
		elif duck_button:
			anim_node.set_current_animation("duck")
			anim_node.set_speed(1/frequency)
		else:
			anim_node.set_speed(frequency*(1+get_parent().total_time/20))
