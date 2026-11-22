extends Node2D

@export var enemy_scene: PackedScene # drag your enemy .tscn here in the Inspector
@export var enemy_scene2: PackedScene # drag your enemy .tscn here in the Inspector

@onready var player: CharacterBody2D = get_parent().get_node("Player")

func _ready() -> void:
	
	const tints = [
		Color("ffb3b3"), # Soft Coral
		Color("ffd1a3"), # Warm Peach
		Color("fff2a6"), # Pale Gold
		Color("b8f2c9"), # Mint Green
		Color("a8f0e8"), # Seafoam
		Color("b3d9ff"), # Ice Blue
		Color("c2c2ff"), # Periwinkle
		Color("e0c2ff"), # Lavender
		Color("ffc2e6"), # Soft Pink
		Color("e8d8c3"), # Warm Sand
	]
	
	var enemy_tint: Color = tints[randi_range(0, len(tints)-1)]
	print(enemy_tint)
	
	
	var enemy
	if randf_range(0.0, 10.0) > 5:
		enemy = enemy_scene.instantiate()
	else:
		enemy = enemy_scene2.instantiate()
		
	
	enemy.position = Vector2(150, 50) # or use a Marker2D's position
	enemy.modulate = enemy_tint       # tints the root so your damage flash won't overwrite it
	add_child(enemy)

	# Wire up targets
	enemy.get_node("Movement").target = player
	enemy.get_node("BotAI").target = player
	player.get_node("Movement").target = enemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
