extends Node

func getMeteor(value):
	return get_children()[value].duplicate()
	pass

func getMeteorRandom():
	return get_children()[rand_range(0, get_children().size())].duplicate()
	pass
