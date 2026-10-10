extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var score: Label = $Panel/Score
@onready var bottom_panel: Panel = $BottomPanel
@onready var credits: Label = $BottomPanel/Credits

func _ready() -> void:
	panel.visible = false
	score.visible = false
	bottom_panel.visible = false
	credits.visible = false
