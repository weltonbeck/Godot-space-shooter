extends CanvasLayer

func _ready():
	set_process(true)
	pass

func _process(delta):
	if Game.gameOver :
		get_tree().set_pause(true)
		get_node("label").show()
		get_node("textureBlackWhite").show()
	pass
