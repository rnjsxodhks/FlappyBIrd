extends Label


func _process(delta: float) -> void:
	#text = "{0}".format([ScoreManager.score])
	text = "{score}".format({"score": ScoreManager.score})
	#text = "%d" % ScoreManager.score
