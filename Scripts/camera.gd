extends Camera2D

# Node references
@export var player : CharacterBody2D

func _process(_delta: float) -> void:
	# Follows the player's position only if the player is moving upwards
	if player.position.y < position.y:
		position.y = player.position.y
