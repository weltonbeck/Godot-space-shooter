extends Camera2D

var velocity = 150
var shake = 0

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_offset(get_offset() + Vector2(0, -1) * velocity * delta)

	if shake > 0 :
		set_position(Vector2(cos(rad2deg(shake)), sin(rad2deg(shake))) * 5)
		shake -= delta
	else :
		set_position(Vector2(0,0))
	pass

func activeShake():
	shake = 0.2
	pass