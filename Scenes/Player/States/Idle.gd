extends Node

func enter(player):
	pass
	
func ready(player):
	pass
	
func update(player, _delta):
	if !player.is_on_floor():
		player.velocity.y += player.GRAVITY
	else:
		 player.velocity.y = player.GRAVITY
		
	if !player.IS_CLONE:	
		if Input.is_action_just_pressed('char_up') && player.is_on_floor():
			player.change_state('jump')
		elif Input.is_action_pressed('char_left') || Input.is_action_pressed('char_right'):
			player.change_state('walk')
		else:
			if player.velocity.x > 0:
				player.velocity.x -= player.BRAKE
			elif player.velocity.x < 0:
				player.velocity.x += player.BRAKE
				
	elif player.IS_CLONE:
		if player.action_player.pressed_buttons['char_up'] && player.is_on_floor():
			player.change_state('jump')
		elif player.action_player.pressed_buttons['char_left'] || player.action_player.pressed_buttons['char_right']:
			player.change_state('walk')
		else:
			if player.velocity.x > 0:
				player.velocity.x -= player.BRAKE
			elif player.velocity.x < 0:
				player.velocity.x += player.BRAKE
	
func exit(player):
	pass
