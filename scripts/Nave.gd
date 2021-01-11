extends Area2D

var velocity = 300
var cannon
var defaultCannonTime = 5
var cannonTime

var CannonSimple = preload("res://scripts/classes/weapons/CannonSimple.gd")
var CannonFast = preload("res://scripts/classes/weapons/CannonFast.gd")
var CannonDouble = preload("res://scripts/classes/weapons/CannonDouble.gd")

var cannons = [
	CannonSimple.new(self),
	CannonFast.new(self),
	CannonDouble.new(self)
]

func _ready():
	set_process(true)
	add_to_group(Game.GROUP_PLAYER)
	cannon = CannonSimple.new(self)
	pass

func _process(delta):
	var moveHorizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var moveVertical = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var direction = Vector2(moveHorizontal, moveVertical).normalized()
	var moveSpeed = velocity * delta

	if get_position().x > 640 - 60 && moveHorizontal == 1:
		moveSpeed = 0
	if get_position().x < 60 && moveHorizontal == -1:
		moveSpeed = 0

	if get_position().y < 45 && moveVertical == -1:
		moveSpeed = 0
	if get_position().y > 480 - 45 && moveVertical == 1:
		moveSpeed = 0

	set_position(get_position() + direction * moveSpeed)
	shootAtack(delta)

	if ! cannon is CannonSimple :
		cannonTime -= delta
		if (cannonTime <= 0) :
			setCannon(0)
	pass

func shootAtack(delta) :
	if Input.is_action_pressed("ui_shoot"):
		cannon.shoot()
		cannon.update(delta)
	pass

func setCannon(value):
	cannonTime = defaultCannonTime
	cannon = cannons[value]
	pass

func removeLife():
	get_node("animationPlayer").play("Damage")
	Game.lives -= 1
	get_node("Shield").activate(3)
	Game.getCamera().activeShake()
	if Game.lives <= 0 :
		set_process(false)
		get_node("animationPlayer").play("Explosion")
	pass

func destroy() :
	Game.gameOver = true
	queue_free()

func _on_Nave_area_entered(area):
	if area.is_in_group(Game.GROUP_ENEMY) :
		if area.has_method("setDamage") :
			area.setDamage(200)
			removeLife()
	elif area.is_in_group(Game.GROUP_ENEMY_SHOOT) :
		removeLife()
		if area.has_method("destroy") :
			area.destroy()
	pass
