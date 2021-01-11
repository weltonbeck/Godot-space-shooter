extends Node

var paths = []
const pathDir = "res://paths/"

var enemiesTextures = []
const enemiesTexturesDir = "res://sprites/Enemies/"

var meteorsTextures = []
const meteorsTexturesDir = "res://sprites/Meteors/"

func _ready():
	loadPath()
	loadMeteors()
	loadEnemies()
	pass

func getRandomPath():
	randomize()
	return paths[rand_range(0, paths.size())]
	pass
	
func loadPath():
	var dir = Directory.new()
	dir.change_dir(pathDir)
	dir.list_dir_begin()

	var path_file = dir.get_next()

	while path_file != "" :
		if path_file != "." && path_file != "..":
			var path = load(pathDir + path_file)
			if path && path is Curve2D:
				paths.append(path)
		path_file = dir.get_next()
	pass

func getRandomEnemiesTextures():
	randomize()
	return enemiesTextures[rand_range(0, enemiesTextures.size())]
	pass

func loadEnemies():
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlack1.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlack2.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlack3.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlack4.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlack5.png"))

	enemiesTextures.append(load("res://sprites/Enemies/enemyBlue1.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlue2.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlue3.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlue4.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyBlue5.png"))

	enemiesTextures.append(load("res://sprites/Enemies/enemyGreen1.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyGreen2.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyGreen3.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyGreen4.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyGreen5.png"))

	enemiesTextures.append(load("res://sprites/Enemies/enemyRed1.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyRed2.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyRed3.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyRed4.png"))
	enemiesTextures.append(load("res://sprites/Enemies/enemyRed5.png"))
	pass

func getRandomMeteorsTextures():
	randomize()
	return meteorsTextures[rand_range(0, meteorsTextures.size())]
	pass

func loadMeteors():
	var dir = Directory.new()
	dir.change_dir(meteorsTexturesDir)
	dir.list_dir_begin()

	var file = dir.get_next()

	while file != "" :
		if file != "." && file != ".." && ! ".import" in file:
			var texture = load(meteorsTexturesDir + file)
			if texture && texture is Texture:
				meteorsTextures.append(texture)
		file = dir.get_next()
	pass
