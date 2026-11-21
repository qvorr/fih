extends Node2D
@export var ATTACK_WINDOW = 0.3
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
		await get_tree().create_timer(ATTACK_WINDOW).timeout
		print("yeah")
		isAttacking = false
		$HighHit/HighHitColl.disabled = true
		$HighHit/OverHitColl.disabled = true
		
	if Input.is_action_just_pressed("attack_mid") && !isAttacking:
		$MidHit/MidHitColl.disabled = false
		isAttacking = true
		await get_tree().create_timer(ATTACK_WINDOW).timeout
		isAttacking = false
		print("mid")
		$MidHit/MidHitColl.disabled = true
		
	if Input.is_action_just_pressed("attack_low") && !isAttacking:
		$LowHit/LowHitColl.disabled = false
		$LowHit/UnderHitColl.disabled = false
		isAttacking = true
		await get_tree().create_timer(ATTACK_WINDOW).timeout
		isAttacking = false
		print("low")
		
		$LowHit/LowHitColl.disabled = true
		$LowHit/UnderHitColl.disabled = true
	

func _on_hit_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_high_hit_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
