extends Label

onready var player = owner

func _physics_process(_delta):
	text = str(player.is_on_floor())
