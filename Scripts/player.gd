class_name Player
extends CharacterBody2D

@export var gravity_force: Vector2 = Vector2(0.0, 3000.0)
@export var jump_velocity: float = -1000.0
@export var speed: float = 300.0
@export var camera: Camera2D
@export var game_over_canvas: CanvasLayer

var height_score = 0.0

func _process(delta: float) -> void:
	# get points
	if velocity.y < 0 and global_position.y < -height_score:
		height_score = -global_position.y
		ScoreSystem.set_score(int(height_score/150))
	
	# player falls
	if position.y > camera.position.y + 548:
		game_over_canvas.visible = true
		velocity.y = 0.0
		gravity_force = Vector2(0, 0)

#runs every physics frame
func _physics_process(delta: float) -> void:
	# puts gravity in the air
	if not is_on_floor():
		velocity += gravity_force * delta
		
	# space bar
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_velocity
	
	# move left and right
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	# moves characterbody
	move_and_slide()
