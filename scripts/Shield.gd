extends Area2D

var active = false

func _ready():
	activate(3)
	pass

func _on_Shield_area_entered(area):
	if active && area.is_in_group(Game.GROUP_ENEMY) :
		area.setDamage(200)
	elif active && area.is_in_group(Game.GROUP_ENEMY_SHOOT) :
		area.queue_free()
	pass

func activate(seconds):
	show()
	active = true
	get_node("timer").set_wait_time(seconds)
	get_node("timer").start()
	pass

func _on_timer_timeout():
	hide()
	active = false
	pass