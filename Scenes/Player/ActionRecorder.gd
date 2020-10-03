extends Node

onready var player = owner
var actions = []

var frame = 0

var pressed_buttons = {
	'char_left': false,
	'char_right': false,
	'char_up': false
}

func _input(event):
	if !player.IS_CLONE:
		if event is InputEventKey:
			if event.is_action("char_left"):
				if event.pressed && !event.is_echo():
					actions.append({ frame = frame, button = "char_left", pressed = true })
				elif !event.pressed:
					actions.append({ frame = frame, button = "char_left", pressed = false })
			if event.is_action("char_right"):
				if event.pressed && !event.is_echo():
					actions.append({ frame = frame, button = "char_right", pressed = true })
				elif !event.pressed:
					actions.append({ frame = frame, button = "char_right", pressed = false })
			if event.is_action("char_up"):
				if event.pressed && !event.is_echo():
					actions.append({ frame = frame, button = "char_up", pressed = true })
				elif !event.pressed:
					actions.append({ frame = frame, button = "char_up", pressed = false })
	
	if player.IS_CLONE:
		if event is InputEventKey:
			if player.action_player.pressed_buttons['char_left'] != pressed_buttons['char_left']:
				if player.action_player.pressed_buttons['char_left']:
					actions.append({ frame = frame, button = "char_left", pressed = true })
					pressed_buttons['char_left'] = true
				else:
					actions.append({ frame = frame, button = "char_left", pressed = false })
					pressed_buttons['char_left'] = false
			if player.action_player.pressed_buttons['char_right'] != pressed_buttons['char_right']:
				if player.action_player.pressed_buttons['char_right']:
					actions.append({ frame = frame, button = "char_right", pressed = true })
					pressed_buttons['char_right'] = true
				else:
					actions.append({ frame = frame, button = "char_right", pressed = false })
					pressed_buttons['char_right'] = false
			if player.action_player.pressed_buttons['char_up'] != pressed_buttons['char_up']:
				if player.action_player.pressed_buttons['char_up']:
					actions.append({ frame = frame, button = "char_up", pressed = true })
					pressed_buttons['char_up'] = true
				elif !event.pressed:
					actions.append({ frame = frame, button = "char_up", pressed = false })
					pressed_buttons['char_up'] = false

func _physics_process(_delta):
	frame += 1
