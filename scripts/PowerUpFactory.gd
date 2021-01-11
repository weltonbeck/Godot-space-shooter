extends Node


func getPowerUpRandom():
	return get_children()[rand_range(0, get_children().size())].duplicate()
	pass