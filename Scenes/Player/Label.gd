extends Label

onready var player = owner

func _physics_process(_delta):
	text = player.current_state.name
