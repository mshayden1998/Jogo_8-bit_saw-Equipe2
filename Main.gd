extends Node2D


var screen_size
export (PackedScene) var Platform


func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(_delta):
	pass


func _on_SpawnTimer_timeout():
	# criar uma nova plataforma ao zerar o timer e adiciona a cena
	var platform = Platform.instance()
	add_child(platform)
	platform.position = Vector2(rand_range(50, screen_size.x), screen_size.y + 10) #define a posição inicial da plataforma, em x, randômico, em y, fora da tela.
