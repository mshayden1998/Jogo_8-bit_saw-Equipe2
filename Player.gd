extends KinematicBody2D


var screen_size
const MOVE_SPEED = 500
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 1000
onready var sprite = $WoodDude
var y_velo = 0
var facing_right = false

signal got_hit


func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(_delta):
	var move_dir = 0
	if Input.is_action_pressed("player_right") and position.x < screen_size.x:
		move_dir += 1
		$WoodDude.flip_h = true
	if Input.is_action_pressed("player_left") and position.x > 0:
		move_dir -= 1
		$WoodDude.flip_h = false
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))
	
	var grounded = is_on_floor()
	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("player_jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED


func _process(delta):
	if position.y < 5 or position.y > screen_size.y - 5:
		position = screen_size
		emit_signal("got_hit")
