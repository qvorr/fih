extends ColorRect

@export var gravity: float = 450.0
@export var lift: float = 600.0

@onready var full_bar: Control = get_parent()
var bar_vel: float = 0.0
var move_timer: float = 0.4
var target_y: float;
@onready var FihMarker: ColorRect = get_parent().get_node("FihMarker")
var fish_speed: float = 50.0

var fill_speed: float = 20.0
var drain_speed: float = 30.0
var progress: float = 50.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_catchbar"): # Space / Enter
		bar_vel -= lift * delta
	else:
		bar_vel += gravity * delta

	position.y += bar_vel * delta

	var max_y = full_bar.size.y - size.y
	if position.y <= 0:
		position.y = 0
		bar_vel = 0
	elif position.y >= max_y:
		position.y = max_y
		bar_vel = 0
		
	
	move_timer -= delta
	FihMarker.position.y = move_toward(FihMarker.position.y, target_y, fish_speed * delta)
	if move_timer <= 0:
		target_y = randf_range(0, full_bar.size.y - FihMarker.size.y)
		move_timer = randf_range(0.5, 1.5)
		
		
	var catching = get_rect().intersects(FihMarker.get_rect())
	
	if catching:
		progress += fill_speed * delta
	else:
		progress -= drain_speed * delta
		
	if progress >= 100.0:
		set_process(false)
	elif progress <= 0.0:
		set_process(false)
		#fight_fish()
		transition_to("res://FightModeScene.tscn")
	
	
	print(progress)
	
	

func fight_fish():
	get_tree().change_scene_to_file("res://FightModeScene.tscn")
	
func transition_to(scene_path: String) -> void:
	set_process(false) # stops the minigame
	var current_scene = get_tree().current_scene
	var next_scene = load(scene_path).instantiate()
	var height = get_viewport_rect().size.y

	next_scene.position.y = height
	get_tree().root.add_child(next_scene)

	var tween = create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(current_scene, "position:y", -height, 0.6)
	tween.tween_property(next_scene, "position:y", 0.0, 0.6)

	await tween.finished
	get_tree().current_scene = next_scene
	current_scene.queue_free()
	
