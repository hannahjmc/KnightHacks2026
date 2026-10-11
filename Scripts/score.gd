extends Label

# makes score
func _ready() -> void:
	ScoreSystem.connect("score_changed", Callable(self, "_on_score_changed"))
	ScoreSystem.score = 0
	ScoreSystem.coinsCollected = 0
	text = "Score: " + str(ScoreSystem.score)
	return

# updates score
func _on_score_changed(new_score):
	text = "Score: " + str(new_score)
