extends RigidBody2D

@onready var detection_area = $Area2D
@export var move_speed: float

# move cloud
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 3
	apply_impulse(Vector2(move_speed * 5,0))
	gravity_scale = 0

func _physics_process(delta: float) -> void:
	# move cloud
	if position.x <= 250:
		apply_impulse(Vector2(move_speed * 5,0))
	if position.x >= -250:
		apply_impulse(Vector2(-move_speed * 5,0))
	
func body_shape_entered():
		gravity_scale = 0.000001

func body_exited():
		set_axis_velocity(Vector2(linear_velocity.x,10))
