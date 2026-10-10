class_name Player
extends CharacterBody2D

func _process(delta: float) -> void:
	pass

#runs every physics frame
func _physics_process(delta: float) -> void:
	
	#moves the CharacterBody based on the velocity
	move_and_slide()
