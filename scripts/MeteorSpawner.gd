extends Node

var preFactory = preload("res://scenes/MeteorFactory.tscn")
var factory

func _ready():
	factory = preFactory.instance()
	pass

func _on_timer_timeout():
	get_node("timer").set_wait_time(rand_range(1, 2))
	var meteor = factory.getMeteorRandom()
	meteor.set_position(Vector2(rand_range(30,610), -40))
	get_owner().add_child(meteor)
	pass
