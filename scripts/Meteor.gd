extends "res://scripts/classes/ClassEnemy.gd"

var velocity = 150
var rotationDirection

func _inicia():
	randomize()
	set_process(true)
	velocity = rand_range(150, 300)
	rotationDirection = rand_range(-180,180);
	pass

func _process(delta):
	set_position (get_position() + Vector2(0,1) * velocity * delta)
	rotate(deg2rad(rotationDirection * delta))
	if get_position().y > 550:
		queue_free()
	pass

func _takeDamage() :
	get_node("animationPlayer").play("Damage")
	pass
	