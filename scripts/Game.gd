extends Node

const GROUP_ENEMY = "Enemy"
const GROUP_PLAYER = "Player"
const GROUP_ENEMY_SHOOT = "EnemyShoot"

var score = 0 setget setScore
var lives = 3 setget setLives
signal scoreChanged
signal livesChanged

var gameOver = false

func _ready():
	randomize()
	pass

func getCamera():
	return get_tree().get_root().get_node("Main").get_node("camera2D")
	pass

func setScore(value) :
	if value > 0:
		score = value
		emit_signal("scoreChanged")
	pass


func setLives(value) :
	lives = value
	emit_signal("livesChanged")
	pass