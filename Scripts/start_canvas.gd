extends CanvasLayer

@onready var logo: TextureRect = $Logo
@onready var start_panel: Panel = $StartPanel
@onready var start_button: Button = $StartButton

@onready var panel: Panel = $"../ScoreCanvas/Panel"
@onready var score: Label = $"../ScoreCanvas/Panel/Score"
@onready var bottom_panel: Panel = $"../ScoreCanvas/BottomPanel"
@onready var credits: Label = $"../ScoreCanvas/BottomPanel/Credits"


func _on_start_button_pressed() -> void:
	logo.visible = false
	start_button.visible = false
	start_panel.visible = false
	
	panel.visible = true
	score.visible = true
	bottom_panel.visible = true
	credits.visible = true
