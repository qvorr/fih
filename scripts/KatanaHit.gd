extends Node2D
@export var ATTACK_WINDOW = 0.3
var SWOOSH_WINDOW = 0.1
@export var COOLDOWN_WINDOW = 0.2
@export var idle_tex: Texture2D
@export var high_tex: Texture2D
@export var high_swoosh_tex: Texture2D
@export var mid_tex: Texture2D
@export var mid_swoosh_tex: Texture2D
@export var low_tex: Texture2D
@export var low_swoosh_tex: Texture2D

@onready var sprite: Sprite2D = get_parent().get_node("Sprite2D")

var isAttacking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack_high") && !isAttacking:
		$HighHit/HighHitColl.disabled = false
		$HighHit/OverHitColl.disabled = false
		isAttacking = true
		sprite.texture = high_swoosh_tex
		await get_tree().create_timer(SWOOSH_WINDOW).timeout
		sprite.texture = high_tex
		await get_tree().create_timer(ATTACK_WINDOW - SWOOSH_WINDOW).timeout
		sprite.texture = idle_tex
		await get_tree().create_timer(COOLDOWN_WINDOW).timeout
		print("high")
		isAttacking = false
		$HighHit/HighHitColl.disabled = true
		$HighHit/OverHitColl.disabled = true
		
	if Input.is_action_just_pressed("attack_mid") && !isAttacking:
		$MidHit/MidHitColl.disabled = false
		isAttacking = true
		sprite.texture = mid_swoosh_tex
		await get_tree().create_timer(SWOOSH_WINDOW).timeout
		sprite.texture = mid_tex
		await get_tree().create_timer(ATTACK_WINDOW - SWOOSH_WINDOW).timeout
		sprite.texture = idle_tex
		await get_tree().create_timer(COOLDOWN_WINDOW).timeout
		isAttacking = false
		print("mid")
		$MidHit/MidHitColl.disabled = true
		
	if Input.is_action_just_pressed("attack_low") && !isAttacking:
		$LowHit/LowHitColl.disabled = false
		$LowHit/UnderHitColl.disabled = false
		isAttacking = true
		sprite.texture = low_swoosh_tex
		await get_tree().create_timer(SWOOSH_WINDOW).timeout
		sprite.texture = low_tex
		await get_tree().create_timer(ATTACK_WINDOW-SWOOSH_WINDOW).timeout
		sprite.texture = idle_tex
		await get_tree().create_timer(COOLDOWN_WINDOW).timeout
		isAttacking = false
		print("low")
		
		$LowHit/LowHitColl.disabled = true
		$LowHit/UnderHitColl.disabled = true
