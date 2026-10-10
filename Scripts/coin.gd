extends RigidBody2D

@export var addedScore : int

@onready var detection_area = $Area2D

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 3

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		queue_free()
