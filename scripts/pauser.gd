extends CanvasLayer


func _ready():
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("ui_pause") && !event.is_echo():
		get_tree().set_pause(!get_tree().is_paused())

		if get_tree().is_paused() :
			get_node("pausedLabel").show()
			get_node("textureBlackWhite").show()
		else:
			get_node("pausedLabel").hide()
			get_node("textureBlackWhite").hide()
	pass
