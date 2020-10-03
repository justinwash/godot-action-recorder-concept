extends KinematicBody2D

export var IS_CLONE = false

onready var game = get_tree().get_root().get_node("Game")

onready var action_recorder = $ActionRecorder
onready var action_player = $ActionPlayer
var actions_temp = []
var pressed_buttons_temp = {
	'char_left': false,
	'char_right': false,
	'char_up': false
}
var actions_end

export var GRAVITY = 25.0
export var JUMP_STRENGTH = 450.0
export var ACCELERATION = 20.0
export var MAX_WALK_SPEED = 250.0
export var BRAKE = 10.0

var velocity = Vector2()

var current_state
onready var states = {
	'idle': $States/Idle,
	'walk': $States/Walk,
	'jump': $States/Jump
}

func _ready():
	if IS_CLONE:
		action_player.actions = actions_temp
		
		for button in pressed_buttons_temp:
			print(button)
			if pressed_buttons_temp[button]:
				action_recorder.actions.append({ frame = 0, button = button, pressed = button })
			
		action_player.end_frame = actions_end
		
	current_state = states.idle
	if current_state.has_method("ready"):
		current_state.ready(self)
	current_state.enter(self)

func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2(0, -1))
	current_state.update(self, delta)
	
func change_state(new_state_name):
	if current_state.has_method('exit'):
		current_state.exit(self)
	current_state = states[new_state_name]
	if current_state.has_method('ready'):
		current_state.ready(self)
	current_state.enter(self)
	
func create_clone(entrance):
	var clone = load("res://Scenes/Player/Player.tscn").instance()
	clone.IS_CLONE = true
	clone.name = 'Clone'
	clone.global_position = entrance.global_position
	clone.velocity.x = 300
	clone.velocity.y = 0
	
	if Input.is_action_pressed('char_left'):
		clone.pressed_buttons_temp['char_left'] = true
	elif Input.is_action_pressed('char_right'):
		clone.pressed_buttons_temp['char_right'] = true
	
	clone.actions_temp = action_recorder.actions
	clone.actions_end = action_recorder.frame
	action_recorder.actions = []
	action_recorder.frame = 0
	action_player.frame = 0
	action_player.action = 0
	
	
	
	game.clones.add_child(clone)

	
