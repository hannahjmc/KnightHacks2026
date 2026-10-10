extends Node2D

#Allows the player to change the color of their clothes and skin
@export var color: Color
@export var skin: Color

#Sets each part of the hat as a number for each part, with 0 being none.
enum hat_part
{
	none,
	Bow,
	GreenHeadband,
	RedHeadband,
	YellowHeadband,
	HardHat,
	CowboyHat,
	Headphones,
	Crown,
	ChefHat,
	PirateHat,
	Robot,
	ModernHelmet,
	TopHat,
	CarmenMiranda,
	PartyHat,
	Unicorn,
	Clown,
	Halo,
	Tiara,
	PonyTail,
	CatEars,
	PinkElf,
	GreenElf,
	Santa,
	Reindeer
}

#Sets each part of the face as a number for each part, with 0 being none.
enum face_part
{
	none,
	RoundGlasses,
	HypnoGlasses,
	RedGoggles,
	RedNose,
	Mustache,
	Sunglasses,
	Eyepatch,
	HeroMask,
	WhiteBeard,
	RedBandana,
	RobotVisor,
	PinkGlasses,
	ScubaMask,
	GasMask
}

#Sets each part of the hand as a number for each part, with 0 being none.
enum hand_part
{
	none,
	Shuriken,
	Sword,
	Banana,
	SmartPhone,
	IceCream,
	Key,
	MagicWand,
	Microphone,
	Pizza,
	Hamburger,
	Potion,
	Baseballbat,
	Blueprints,
	PaintBrush,
	CandyCane,
	Hammer
}

#Sets each part of the upper body as a number for each part, with 0 being none.
enum upper_body_part
{
	none,
	CodeNinjasTee,
	Tuxedo,
	RedSash,
	CrossBelts,
	GreenScarf,
	YellowWings,
	FastTee,
	JetPack,
	BackPack,
	ScubaTank,
	Jersey,
	Astronaut,
	Knight,
	Robot,
	PinkElf,
	GreenElf,
	Santa,
	Reindeer
}

#Sets each part of the lower body as a number for each part, with 0 being none.
enum lower_body_part
{
	none,
	TropicalTrunks,
	WhiteBelt,
	YellowBelt,
	OrangeBelt,
	GreenBelt,
	BlueBelt,
	PurpleBelt,
	RedBelt,
	BrownBelt,
	BlackBelt,
	Robot,
	BlackPants,
	Astronaut,
	Knight,
	GreenTail,
	Apron,
	WrestlingBelt,
	GoldBuckledBlackBelt,
	GoldBuckledRedBelt
}

#Allows the player to choose what their avatar looks like
@export var hat_part_number: hat_part
@export var face_part_number: face_part
@export var hand_part_number: hand_part
@export var upper_body_part_number: upper_body_part
@export var lower_body_part_number: lower_body_part

# Sets the variable for the selected sprite and how it looks.
var child_sprite: Sprite2D
#A variable for the list of parts that can be modified.
var costume_parts = ["Head", "LArm", "LLeg", "RArm", "RLeg", "Body"]
#The sprite variables for each part
var hat_part_sprite: Sprite2D
var face_part_sprite: Sprite2D
var hand_part_sprite: Sprite2D
var upper_body_part_sprite: Sprite2D
var lower_body_part_sprite: Sprite2D
#The part number for the currently selected sprite
var part_number: String
#Sets the max number for each part
var max_hat: int = 25
var max_face: int = 14
var max_hand: int = 16
var max_upper_body: int = 18
var max_lower_body: int = 19

#Function that starts as soon as the game loads
func _ready():
	#Resets all the parts back to default
	_resetParts()
	
	#Changes the color for each costume part
	for part in costume_parts:
		child_sprite = get_parent().find_child(part)
		child_sprite.self_modulate = color
	
	#Changes the color of the face
	child_sprite = get_parent().find_child("Face")
	child_sprite.self_modulate = skin
	
	#Sets all the parts as the player asked for
	setParts()

#Function to reset all parts to default settings
func _resetParts():
	#Turns off all lower body parts
	for lower in range(1,max_lower_body):
		part_number = str(lower)
		if lower < 10:
			part_number = "0" + str(lower)
		lower_body_part_sprite = get_parent().find_child("LowerBody" + part_number, true)
		lower_body_part_sprite.visible = false
	
	#Turns off all upper body parts
	for upper in range(1,max_upper_body):
		part_number = str(upper)
		if upper < 10:
			part_number = "0" + str(upper)
		upper_body_part_sprite = get_parent().find_child("UpperBody" + part_number, true)
		upper_body_part_sprite.visible = false
		
	#Turns off all hat parts
	for hat in range(1,max_hat):
		part_number = str(hat)
		if hat < 10:
			part_number = "0" + str(hat)
		hat_part_sprite = get_parent().find_child("HatPart" + part_number, true)
		hat_part_sprite.visible = false
		
	#Turns off all hand parts
	for hand in range(1,max_hand):
		part_number = str(hand)
		if hand < 10:
			part_number = "0" + str(hand)
		hand_part_sprite = get_parent().find_child("HandPart" + part_number, true)
		hand_part_sprite.visible = false
		
	#Turns off all face parts
	for face in range(1,max_face):
		part_number = str(face)
		if face < 10:
			part_number = "0" + str(face)
		face_part_sprite = get_parent().find_child("FacePart" + part_number, true)
		face_part_sprite.visible = false

#Function that sets all parts on a player to sselected values
func setParts():
	#If the function isnt set to none, then changes the part to the selected part for each one.
	if lower_body_part_number != 0:
		var lbpNumber: int = lower_body_part_number
		var part_number: String = str(lbpNumber)
		if lbpNumber < 10:
			part_number = "0" + str(lbpNumber)
		lower_body_part_sprite = get_parent().find_child("LowerBody" + part_number)
		lower_body_part_sprite.visible = true
	
	if upper_body_part_number != 0:
		var ubpNumber: int = upper_body_part_number
		var part_number: String = str(ubpNumber)
		if ubpNumber < 10:
			part_number = "0" + str(ubpNumber)
		upper_body_part_sprite = get_parent().find_child("UpperBody" + part_number)
		upper_body_part_sprite.visible = true
	
	if hat_part_number != 0:
		var hatpNumber: int = hat_part_number
		var part_number: String = str(hatpNumber)
		if hatpNumber < 10:
			part_number = "0" + str(hatpNumber)
		hat_part_sprite = get_parent().find_child("HatPart" + part_number)
		hat_part_sprite.visible = true
	
	if face_part_number != 0:
		var fpNumber: int = face_part_number
		var part_number: String = str(fpNumber)
		if fpNumber < 10:
			part_number = "0" + str(fpNumber)
		face_part_sprite = get_parent().find_child("FacePart" + part_number)
		face_part_sprite.visible = true
	
	if hand_part_number != 0:
		var handpNumber: int = hand_part_number
		var part_number: String = str(handpNumber)
		if handpNumber < 10:
			part_number = "0" + str(handpNumber)
		hand_part_sprite = get_parent().find_child("HandPart" + part_number)
		hand_part_sprite.visible = true
