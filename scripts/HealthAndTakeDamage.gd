extends Node2D


const DEFAULT_HEALTH_VALUE = 50
const DAMAGE_ON_HIT = 5
const DAMAGE_TINT_WINDOW = 0.5
var health = DEFAULT_HEALTH_VALUE
@onready var player: CharacterBody2D = get_parent()
@onready var isOpponentBlocking: Node2D = get_parent().get_node("Katana")
@onready var sprite: Sprite2D = get_parent().get_node("Sprite2D")


func take_damage(damageOnHit):
	health -= damageOnHit
	sprite.modulate = Color.WHITE.lerp(Color.RED, 0.3)
	
	await get_tree().create_timer(DAMAGE_TINT_WINDOW).timeout

	sprite.modulate = Color.WHITE
	if health <= 0:
		player.queue_free()
	
	
	
	print('me enemy')
	print(health)
	
	


func _on_hit_body_entered(body: Node2D) -> void:
	if body == get_parent(): 
		return
	var enemy = body.get_node_or_null("HealthAndDmgTk")
	enemy.take_damage(DAMAGE_ON_HIT)
	print(player.name + " health's is " + str(health))
