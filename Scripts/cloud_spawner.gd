extends Node2D

@export var cloud : RigidBody2D
@export var player : CharacterBody2D
@export var camera : Camera2D

@export var min_spawn_x : float = -250.0 # spawn left
@export var max_spawn_x : float = 250.0 # spawn right
@export var vertical_spacing : float = 150.0  # cloud space
@export var clouds_max : int = 5 # initial clouds

# height of highest cloud
var last_cloud_y : float = 350.0

func _process(_delta: float) -> void:
	# remove clouds not in view
	var camera_y = camera.global_position.y 
	for cloud in get_children():
		if cloud.position.y > camera_y + 600:  
			cloud.queue_free()

# create new clouds
	var player_pos = player.global_position
	if player_pos.y < (last_cloud_y + 400):
		for j in range(2):
			spawn_cloud()

func _ready():
	for i in range(clouds_max):
		spawn_cloud()
		
func spawn_cloud():
	var random_x_position: float = randf_range(min_spawn_x, max_spawn_x)
	var new_y_position : float = last_cloud_y - vertical_spacing
	
	var new_cloud = cloud.duplicate()
	new_cloud.transform = Transform2D(0.0 ,Vector2(random_x_position, new_y_position))
	last_cloud_y = new_y_position
	add_child(new_cloud)
