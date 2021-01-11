extends Area2D

const spin = 360
var velocity = 300
const dir = Vector2(0, 1)

func _ready():
	add_to_group(Game.GROUP_ENEMY_SHOOT)
	set_process(true)
	pass


func _process(delta):
	rotate(deg2rad(spin) * delta)
	translate(dir * velocity * delta)

	if get_position().y > 550:
		queue_free()
	pass

func destroy():
	queue_free()