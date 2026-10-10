extends Label

# Connects Label(Score) to signal and initializes score
func _ready() -> void:
	#ScoreSystem.connect("score_changed", Callable(self, "_on_score_changed"))
	#text = "Score: " + str(ScoreSystem.score)
	return

# Updates new score value
func _on_score_changed(new_score):
	
	return
