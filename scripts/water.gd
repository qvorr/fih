extends Node2D

@export var water1_speed: float = 1
@export var water2_speed: float = 1
@export var water3_speed: float = 1
@export var water4_speed: float = 1
@export var foam_speed: float = 1
const DELTA_SPEED = 3

func _ready() -> void:
	$Water1.autoscroll.x = water1_speed / DELTA_SPEED
	$Water2.autoscroll.x = water2_speed / DELTA_SPEED
	$Water3.autoscroll.x = water3_speed / DELTA_SPEED
	$Water4.autoscroll.x = water4_speed / DELTA_SPEED
	$Foam.autoscroll.x = foam_speed / DELTA_SPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
