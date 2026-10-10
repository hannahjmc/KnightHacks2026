extends Node

var score := 0
signal score_changed(new_score) # Lets the script know that score has changed

var coinsCollected := 0

func add_coin(amount: int) -> void:
	coinsCollected += amount
	emit_signal("score_changed", score + coinsCollected) # Connected scripts are notified of score change

func set_score(amount: int) -> void:
	score = amount
	emit_signal("score_changed", score + coinsCollected) # Connected scripts are notified of score change
