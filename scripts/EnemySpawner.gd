extends Node2D

var preEnemyPath = preload("res://scenes/enemies/PathEnemy.tscn")

func _ready():
	randomizeTimer()
	pass


func randomizeTimer():
	get_node("timer").set_wait_time(rand_range(5,10))
	pass

func _on_timer_timeout():
	var enemy = preEnemyPath.instance()
	get_parent().add_child(enemy)
	randomizeTimer()
	pass
