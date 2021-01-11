extends Node2D

var preFactory = preload("res://scenes/PowerUpFactory.tscn")
var factory

func _ready():
	factory = preFactory.instance()
	pass

func _on_timer_timeout():
	get_node("timer").set_wait_time(rand_range(1, 2))
	var powerup = factory.getPowerUpRandom()
	powerup.set_position(Vector2(rand_range(30,610), rand_range(30,450)))
	get_owner().add_child(powerup)
	pass
