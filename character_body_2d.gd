extends CharacterBody2D


@export var SPEED = 50
# const JUMP_VELOCITY = -400.0
@export_range(0, 1000, 10) var FRICTION = 190


func _physics_process(delta: float) -> void:
	# keeps the character from moving outside the frame, and accounts for character size
	var half_size = ($CollisionShape2D.shape.get_rect().size * global_scale) / 2.0
	position = position.clamp(half_size, get_viewport_rect().size - half_size)

	
	# stops the character when not pressing a direction

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = velocity.move_toward(direction*SPEED, FRICTION*delta)

	#else:
		#velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		

	#if velocity.length() > 0:
		#velocity = velocity.normalized() * SPEED
	
	move_and_slide()
