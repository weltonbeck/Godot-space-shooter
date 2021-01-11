extends Label

func _ready():
	Game.connect("scoreChanged", self, "onScoreChanged")
	pass

func onScoreChanged():
	set_text("SCORE: " + str(Game.score).pad_zeros(10))
	pass
