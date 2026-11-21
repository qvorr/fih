extends Node2D


const DEFAULT_HEALTH_VALUE = 50
const DAMAGE_ON_HIT = 5
var health = DEFAULT_HEALTH_VALUE
@onready var player: CharacterBody2D = get_parent()


func take_damage(damageOnHit):
	health -= damageOnHit
	
	print('me enemy')
	print(health)
	
	


func _on_hit_body_entered(body: Node2D) -> void:
	if body == get_parent(): 
		return
	var enemy = body.get_node_or_null("HealthAndDmgTk")
	enemy.take_damage(DAMAGE_ON_HIT)
	print(player.name + " health's is " + str(health))
