extends Node2D

@onready var player: CharacterBody2D = get_parent()
@onready var player_shape: CollisionShape2D = get_parent().get_node("CollisionShape2D")
@export var SPEED = 50
@export_range(0, 1000, 10) var FRICTION = 190

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#if not player or not collision_body:
		#return
		#
	


	
	# stops the character smoothly when not pressing a direction

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = player.velocity.move_toward(direction*SPEED, FRICTION*delta)
	
	player.move_and_slide()
	
	# keeps the character from moving outside the frame, and accounts for character size
	var half_size = (player_shape.shape.get_rect().size * player_shape.global_scale) / 2.0
	player.position = player.position.clamp(half_size, get_viewport_rect().size - half_size)
