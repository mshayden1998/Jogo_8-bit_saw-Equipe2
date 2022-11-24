extends KinematicBody2D


var screen_size
export var move_speed = 150
var velocity = Vector2(0, 1)


func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(_delta):
	move_and_slide(velocity * move_speed)


func _process(delta):
	# apaga a instância da plataforma se ela estiver fora da tela no eixo Y (ou
	# seja, libera memória)
	if position.y > screen_size.y:
		queue_free()
