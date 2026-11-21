extends Node2D

@onready var Movement: Node2D = get_parent().get_node("Movement")
@onready var Katana: Node2D = get_parent().get_node("Katana")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack_high"):
		Katana.attack_high()
	if Input.is_action_just_pressed("attack_mid"):
		Katana.attack_mid()
	if Input.is_action_just_pressed("attack_low"):
		Katana.attack_low()
	if Input.is_action_just_pressed("block_high"):
		Katana.block_high()
	if Input.is_action_just_pressed("block_low"):
		Katana.block_low()
		
	Movement.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
	
