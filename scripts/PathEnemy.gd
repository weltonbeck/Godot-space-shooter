extends Path2D

# espera o elemento estar carregado na cena
onready var follow = get_node("pathFollow2D")
var velocity = 250

func _ready():
	set_curve(Resources.getRandomPath())
	set_process(true)
	pass

func _process(delta):
	# anda pelo path
	follow.set_offset(follow.get_offset() + velocity * delta)
	# quando path = 1 destroy
	if follow.get_unit_offset() >= 1:
		queue_free()

	pass