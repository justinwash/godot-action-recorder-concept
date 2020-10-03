extends Node2D

export(NodePath) var ENTRANCE
onready var entrance = get_node(ENTRANCE)

func _on_Area2D_body_entered(body):
	if body.name == "Player" || "Clone" in body.name:
		entrance.activate(body)
		body.create_clone(entrance)
