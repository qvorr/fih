extends Node2D
@export var ATTACK_WINDOW = 0.3
@export var BLOCK_WINDOW = 0.2
var SWOOSH_WINDOW = 0.1
@export var COOLDOWN_WINDOW = 0.2
@export var idle_tex: Texture2D
@export var high_tex: Texture2D
@export var high_swoosh_tex: Texture2D
@export var mid_tex: Texture2D
@export var mid_swoosh_tex: Texture2D
@export var low_tex: Texture2D
@export var low_swoosh_tex: Texture2D
@export var high_block: Texture2D
@export var high_block_spark: Texture2D
@export var low_block: Texture2D
@export var low_block_spark: Texture2D

@onready var sprite: Sprite2D = get_parent().get_node("Sprite2D")

var isAttacking = false
var isBlocking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("attack_high") && !isAttacking && !isBlocking:
		#attack_high()
		#
	#if Input.is_action_just_pressed("attack_mid") && !isAttacking && !isBlocking:
		#attack_mid()
		#
	#if Input.is_action_just_pressed("attack_low") && !isAttacking && !isBlocking:
		#attack_low()
		#
	#if Input.is_action_just_pressed("block_high") && !isAttacking && !isBlocking:
		#block_high()
		#
		#
	#if Input.is_action_just_pressed("block_low") && !isAttacking && !isBlocking:
		#block_low()
		#
		#
	#
	
	
func attack_high():
	if isAttacking or isBlocking:
		return
	$HighHit/HighHitColl.disabled = false
	$HighHit/OverHitColl.disabled = false
	isAttacking = true
	sprite.texture = high_swoosh_tex
	await get_tree().create_timer(SWOOSH_WINDOW).timeout
	sprite.texture = high_tex
	await get_tree().create_timer(ATTACK_WINDOW - SWOOSH_WINDOW).timeout
	sprite.texture = idle_tex
	$HighHit/HighHitColl.disabled = true
	$HighHit/OverHitColl.disabled = true
	await get_tree().create_timer(COOLDOWN_WINDOW).timeout
	print("high")
	isAttacking = false
	
	
func attack_mid():
	if isAttacking or isBlocking:
		return
	$MidHit/MidHitColl.disabled = false
	isAttacking = true
	sprite.texture = mid_swoosh_tex
	await get_tree().create_timer(SWOOSH_WINDOW).timeout
	sprite.texture = mid_tex
	await get_tree().create_timer(ATTACK_WINDOW - SWOOSH_WINDOW).timeout
	sprite.texture = idle_tex
	$MidHit/MidHitColl.disabled = true
	await get_tree().create_timer(COOLDOWN_WINDOW).timeout
	isAttacking = false
	print("mid")
	
	
func attack_low():
	if isAttacking or isBlocking:
		return
	$LowHit/LowHitColl.disabled = false
	$LowHit/UnderHitColl.disabled = false
	isAttacking = true
	sprite.texture = low_swoosh_tex
	await get_tree().create_timer(SWOOSH_WINDOW).timeout
	sprite.texture = low_tex
	await get_tree().create_timer(ATTACK_WINDOW-SWOOSH_WINDOW).timeout
	sprite.texture = idle_tex
	$LowHit/LowHitColl.disabled = true
	$LowHit/UnderHitColl.disabled = true
	await get_tree().create_timer(COOLDOWN_WINDOW).timeout
	isAttacking = false
	print("low")
	
func block_high():
	if isAttacking or isBlocking:
		return
	$BlockHigh/CollisionShape2D.disabled = false
	sprite.texture = high_block
	isBlocking = true
	await get_tree().create_timer(BLOCK_WINDOW).timeout
	isBlocking = false
	sprite.texture = idle_tex
	$BlockHigh/CollisionShape2D.disabled = true
	print("block-high")
	
	
func block_low():
	if isAttacking or isBlocking:
		return
	$BlockLow/CollisionShape2D.disabled = false
	sprite.texture = low_block
	isBlocking = true
	await get_tree().create_timer(BLOCK_WINDOW).timeout
	isBlocking = false
	sprite.texture = idle_tex
	$BlockLow/CollisionShape2D.disabled = true
	print("block-low")
	
