extends Area2D

func _ready():
	pass

func _on_PowerUpCannonDouble_area_entered(area) :
	if area.is_in_group(Game.GROUP_PLAYER) :
		if area.has_method("setCannon") :
			get_node("audioStreamPlayer").play()
			get_node("animationPlayer").play("GetPowerUp")
			area.setCannon(2)
	pass