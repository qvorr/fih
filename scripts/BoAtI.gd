extends Node2D

@export var target: CharacterBody2D;
@export var attack_range: float = 30.0;
@onready var BotMvmnt: Node2D = get_parent().get_node("Movement")
@onready var BotAttack: Node2D = get_parent().get_node("Katana")
@onready var BotParent: Node2D = get_parent()
enum State {APPROACH, ENGAGE, RETREAT}
var state = State.APPROACH
var decision_timer: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_instance_valid(target):
		return
	var to_player = target.global_position - BotMvmnt.global_position
	var dist = to_player.length()
	
	match state:
		State.APPROACH:
			BotMvmnt.direction = to_player.normalized()
			if dist <= attack_range:
				state = State.ENGAGE
		State.ENGAGE:
			BotMvmnt.direction = Vector2.ZERO
			if dist > attack_range:
				state = State.APPROACH
				return
			else:
				decision_timer -= delta
			
			if decision_timer <= 0:
				var descider = randi() % 4;
				match descider:
					0:
						BotAttack.attack_high()
					1:
						BotAttack.attack_mid()
					2:
						BotAttack.attack_low()
					_:
						state = State.RETREAT
				decision_timer = randf_range(0.4, 0.8)
		State.RETREAT:
			BotMvmnt.direction = -to_player.normalized()
			decision_timer -= delta
			if decision_timer <= 0:
				state = State.APPROACH
			
	
	
	
	
	
	
	
	
	
