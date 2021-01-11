extends Node2D

export(Texture) var texture

func _ready():
	Game.connect("livesChanged", self, "onLivesChanged")
	pass

func onLivesChanged():
	update()
	pass

func _draw():
	for n in range(0, Game.lives) :
		draw_texture(texture, Vector2(n * (texture.get_width() + 10),0))
	pass