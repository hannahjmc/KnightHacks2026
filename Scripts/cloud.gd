extends RigidBody2D

@onready var detection_area = $Area2D

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 3
	gravity_scale = 0

func _physics_process(delta: float) -> void:
	pass
	
func body_shape_entered():
		gravity_scale = 0.000001

func body_exited():
		set_axis_velocity(Vector2(linear_velocity.x,10))
