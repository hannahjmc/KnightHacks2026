extends Node2D

# Node References
@export var coin_scene : PackedScene
@export var player : CharacterBody2D
@export var camera : Camera2D

# Cloud Placement Variables
@export var min_spawn_x : float = -250.0 # How far left coins can spawn
@export var max_spawn_x : float = 250.0 # How far right coins can spawn
@export var vertical_spacing : float = 150.0  # How far coins are spaced vertically
@export var coins_max : int = 5 # The amount of initial coins spawned

# This keeps track of the height of the current highest cloud
var last_coin_y : float = 350.0

func _process(_delta: float) -> void:
	# Platforms that leave camera view will be removed
	var camera_y = camera.global_position.y 
	for cloud in get_children():
		if cloud.position.y > camera_y + 600:  
			cloud.queue_free()

# Detect if player is near top platform and spawn new platforms
	var player_pos = player.global_position
	if player_pos.y < (last_coin_y + 400):
		for j in range(2):
			spawn_coin()

func _ready():
	for i in range(coins_max):
		spawn_coin()
		
func spawn_coin():
	var random_x_position: float = randf_range(min_spawn_x, max_spawn_x)
	var new_y_position : float = last_coin_y - vertical_spacing
	
	var new_coin = coin_scene.instantiate()
	new_coin.transform = Transform2D(0.0 ,Vector2(random_x_position, new_y_position))
	last_coin_y = new_y_position
	add_child(new_coin)
