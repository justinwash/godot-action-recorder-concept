extends Node

func enter(player):
	player.velocity.y = -player.JUMP_STRENGTH
	
func ready(player):
	pass
	
func update(player, _delta):
	if !player.is_on_floor():
		player.velocity.y += player.GRAVITY
	else:
		 player.change_state('idle')
		
	if !player.IS_CLONE:	
		if Input.is_action_pressed("char_left") && !player.IS_CLONE:
			if player.velocity.x >= -player.MAX_WALK_SPEED:
				player.velocity.x -= player.ACCELERATION
		elif Input.is_action_pressed("char_right") && !player.IS_CLONE:
			if player.velocity.x <= player.MAX_WALK_SPEED:
				player.velocity.x += player.ACCELERATION
		else:
			player.change_state('idle')
			
	if player.IS_CLONE:	
		if player.action_player.pressed_buttons['char_left']:
			if player.velocity.x >= -player.MAX_WALK_SPEED:
				player.velocity.x -= player.ACCELERATION
		elif player.action_player.pressed_buttons['char_right']:
			if player.velocity.x <= player.MAX_WALK_SPEED:
				player.velocity.x += player.ACCELERATION
		else:
			player.change_state('idle')
	
func exit(player):
	pass
