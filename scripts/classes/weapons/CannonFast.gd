
var preShoot = preload("res://scenes/ShootRed.tscn")
var shootInterval = 0.15
var lastShoot = 0
var nave

func _init(node) :
	self.nave = node
	pass

func shoot() :
	if lastShoot <= 0 :
		intanciateShoot(nave.get_node("posCenterCannon"))
		lastShoot = shootInterval
	pass

func intanciateShoot(node) :
	var shoot = preShoot.instance()
	shoot.set_global_position(node.get_global_position())
	nave.get_owner().add_child(shoot)
	pass

func update(delta):
	if lastShoot > 0 :
		lastShoot -= delta
	pass
