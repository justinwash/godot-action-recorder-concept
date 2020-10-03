extends Node

var clone
var actions = []
var frame = 0
var end_frame

var pressed_buttons = {
	'char_left': false,
	'char_right': false,
	'char_up': false
}

var action = 0

func _ready():
	clone = owner if owner.IS_CLONE else null
	frame = 0
	
func _physics_process(_delta):
	if clone:
		if len(actions) > action:
			if actions[action].frame == frame:
				print('should do action: ', actions[action].button, ' ', actions[action].pressed)
				pressed_buttons[actions[action].button] = actions[action].pressed
				action += 1
	frame += 1
