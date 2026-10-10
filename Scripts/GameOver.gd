extends Node

@export var game_over_canvas: CanvasLayer
@export var score: Label
@export var reset_button: Button

# show game over screen
func game_over():
	game_over_canvas.visible = true
	score.visible = false
	
func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
