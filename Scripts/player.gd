class_name Player
extends CharacterBody2D

@export var gravity_force: Vector2 = Vector2(0.0, 3000.0)
@export var jump_velocity: float = -1000.0
@export var speed: float = 300.0
@export var camera: Camera2D
@export var game_over_canvas: CanvasLayer
@export var xBounds: float = 310.0

@onready var lenny = $AnimatedSprite2D

var height_score : float = 0.0

func _process(_delta: float) -> void:
	# get points
	if velocity.y < 0 and global_position.y < -height_score:
		height_score = -global_position.y
		ScoreSystem.set_score(int(height_score/150))
		
	# player falls
	if position.y > camera.position.y + 548:
		game_over_canvas.visible = true
		velocity.y = 0.0
		gravity_force = Vector2(0, 0)

# runs every physics frame
func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity += gravity_force * delta
		
	# jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	
	# movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		lenny.flip_h = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	
	move_and_slide()
	
	# animation
	if not is_on_floor():
		if velocity.y < 0:
			lenny.play("Jump")
		else:
			lenny.play("Fall")
	else:
		if velocity.x != 0:
			lenny.play("Walk")
		else:
			lenny.play("Idle")
