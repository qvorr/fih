extends Node2D


const DEFAULT_HEALTH_VALUE = 50
const DAMAGE_ON_HIT = 5
var health = DEFAULT_HEALTH_VALUE





func _on_hit_body_entered(body: Node2D) -> void:
	health -= DAMAGE_ON_HIT
	print(health)
	pass # Replace with function body.
