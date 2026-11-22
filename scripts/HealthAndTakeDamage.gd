extends Node2D


const DEFAULT_HEALTH_VALUE = 50
const DAMAGE_ON_HIT = 5
const DAMAGE_TINT_WINDOW = 0.5
const SHOW_SPARKS_WINDOW = 0.2
var health = DEFAULT_HEALTH_VALUE
@onready var player: CharacterBody2D = get_parent()
@onready var meAttack: Node2D = get_parent().get_node("Katana")
@onready var sprite: Sprite2D = get_parent().get_node("Sprite2D")
@export var isPlayer: bool;

var isBlocking: bool;



func take_damage(damageOnHit):
	if isPlayer && isBlocking:
		if meAttack.isHighBlocking:  sprite.texture = meAttack.spark_high_tex
		elif meAttack.isLowBlocking: 
			sprite.texture = meAttack.spark_low_tex
		await get_tree().create_timer(SHOW_SPARKS_WINDOW).timeout
		sprite.texture = meAttack.idle_tex
		return
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


func _on_block_entered(body: Node2D) -> void:
	isBlocking = true;
	await get_tree().create_timer(meAttack.BLOCK_WINDOW).timeout
	isBlocking = false;
	
	
	
	
	
