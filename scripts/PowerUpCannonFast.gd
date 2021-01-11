extends Area2D

func _ready():
	pass

func _on_PowerUpCannonFast_area_entered(area) :
	if area.is_in_group(Game.GROUP_PLAYER) :
		if area.has_method("setCannon") :
			get_node("audioStreamPlayer").play()
			get_node("animationPlayer").play("GetPowerUp")
			area.setCannon(1)
	pass
