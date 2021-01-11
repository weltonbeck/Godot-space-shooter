extends "res://scripts/classes/ClassEnemy.gd"

var preShoot = preload("res://scenes/enemies/EnemyShoot.tscn")

func _inicia():
	get_node("sprite").set_texture(Resources.getRandomEnemiesTextures())
	pass

func _on_shootTimer_timeout():
	var shoot = preShoot.instance()
	shoot.set_global_position(get_node("position2D").get_global_position())
	Game.getCamera().add_child(shoot)
	pass

func _takeDamage() :
	get_node("animationPlayer").play("Damage")
	pass

func _destroy() :
	get_node("shootTimer").stop()
	pass

func destroy() :
	get_owner().queue_free()
	pass
