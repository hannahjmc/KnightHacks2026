extends Camera2D

@export var player : CharacterBody2D

func _process(_delta: float) -> void:
	# follow player
	if player.position.y < position.y:
		position.y = player.position.y
