extends RigidBody2D

@export var addedScore : int

@onready var detection_area = $Area2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 3

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		ScoreSystem.add_coin(1)
		audio_stream_player.reparent(get_tree().current_scene)
		audio_stream_player.play()
		audio_stream_player.finished.connect(audio_stream_player.queue_free)
		queue_free()
