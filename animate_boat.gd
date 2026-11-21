extends AnimatableBody2D

@export var distance := 1.0   # Change to e.g. 50.0 to see it clearly
@export var step_time := 0.2 * 100 # Seconds per side

func _ready() -> void:
	var tween := create_tween().set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)

	tween.tween_property(self, "position", Vector2(0, -distance), step_time).as_relative() # Up
	tween.tween_property(self, "position", Vector2(distance, 0), step_time).as_relative()  # Right
	tween.tween_property(self, "position", Vector2(0, distance), step_time).as_relative()  # Down
	tween.tween_property(self, "position", Vector2(-distance, 0), step_time).as_relative() # Left

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
