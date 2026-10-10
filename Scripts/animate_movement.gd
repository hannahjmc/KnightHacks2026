extends AnimationPlayer

#Define the name of each Animation in the Folders
@export var crouch_anim: String = "crouch"
@export var fall_down_anim: String = "fall_down"
@export var idle_anim: String = "idle"
@export var jump_up_anim: String = "jump_up"
@export var run_anim: String = "run"
@export var reset_animations: String = "RESET"

#Bool for if the Player can jump
var can_jump: bool

#The actual player Node
var player: CharacterBody2D

#Bools for running the animations
var running: bool
var on_ground: bool
var jumping: bool
var falling: bool
var jump_start: bool
var idle: bool

#Function that runs as the code starts, sets all the variables (Minus the idle) to false to indicate it starts idle.
func _ready():
	running = false
	on_ground = false
	jumping = false
	falling = false
	jump_start = false
	idle = true
	#Sets the player to the parent node.
	player = get_parent()

#Function that runs every frame
func _process(delta):
	#Sets the Left and Right controls to horizontal variable
	var horizontal: float = Input.get_axis("ui_left", "ui_right")
	#Sets the Up and Down controls to vertical variable
	var vertical: float = Input.get_axis("ui_left", "ui_right")
	
	#Variable for if the player is currently moving up or down
	var vertical_velocity: float = player.velocity.y
	
	#If the verical velocity is up, the player is jumping.
	if vertical_velocity > 0.1:
		jumping = true
		falling = false
		can_jump = false
		on_ground = false
		idle = false
	#If the vertical velocity is down, te player is falling
	elif vertical_velocity < -0.5:
		jumping = false
		falling = true
		can_jump = false
		on_ground = false
		idle = false
	#Otherwise, it is staying on the same Y
	else:
		jumping = false
		falling = false
		can_jump = true
		on_ground = false
	
	#If the player cant jump, theyre not on the ground
	if !can_jump:
		on_ground = false
		idle = false
	else:
		on_ground = true
	
	#If the player jumps, then it can start the jump animation
	if(Input.is_action_just_pressed("ui_accept")):
		jump_start = true
		idle = false
	else:
		jump_start = false
	
	#If the player is moving left or right and theyre on the ground, theyre running.
	if horizontal != 0 && on_ground:
		running = true
		idle = false
	else:
		running = false
	
	#If the player is facing to the right, make sure their scale is to the right.
	if horizontal > 0:
		var this_scale:Vector2 = get_parent().scale
		if this_scale.y < 0:
			this_scale.x *= -1
		get_parent().scale = this_scale
	#If the player is facing to the left, their scale is to the left.
	elif horizontal < 0:
		var this_scale:Vector2 = get_parent().scale
		if this_scale.y > 0:
			this_scale.x *= -1
		get_parent().scale = this_scale
		
	#If the player is running on the ground it plays the run animation
	if running && on_ground:
		current_animation = run_anim
	#If the player is falling not on the ground or falling while not jumping, play the fall down animation
	elif (falling && !on_ground) || (falling && !jumping):
		current_animation = fall_down_anim
		# If the player stops falling and they hit the ground, play the crouch animation
		if on_ground && !falling:
			current_animation = crouch_anim
	#If the player is idle and not running, they play the  idle animation
	elif idle && !running:
		current_animation = idle_anim
	#If  the player is jumping and no longer on the ground, the jump up animation plays
	elif !on_ground && jumping:
		current_animation = jump_up_anim
	#If the player starts jumping, then plays the crouch animation
	elif jump_start:
		current_animation = crouch_anim
	#If no other animations are playing, reset back to the basic pose to help go into other animations.
	else:
		current_animation = reset_animations
		idle = true
