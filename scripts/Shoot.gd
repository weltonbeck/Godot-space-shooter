extends Area2D

var velocity = 400
var damage = 1

func _ready():
	set_process(true)
	get_node("audioStreamShoot").play()
	pass

func _process(delta):
	set_position(get_position() + Vector2(0,-1) * velocity * delta)

	if get_position().y < 5:
		queue_free()
	pass

func _on_Shoot_area_entered( area ):
	if area.is_in_group(Game.GROUP_ENEMY) :
		if area.has_method("setDamage") :
			area.setDamage(damage)
		if area.has_method("setPoints") :
			area.setPoints()
		queue_free()
	pass
