extends Node2D

onready var player = get_tree().get_root().get_node("Game/Player")

export var START = true

func _ready():
	if START:
		activate(player)
	
func activate(player_or_clone):
	player_or_clone.global_position = self.global_position
	player_or_clone.velocity.x = 300
	player_or_clone.velocity.y = 0
	

