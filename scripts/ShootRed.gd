extends "res://scripts/Shoot.gd"

func _ready():
	set_process(true)
	get_node("audioStreamShoot").play()
	velocity = 700
	damage = 0.5
	pass