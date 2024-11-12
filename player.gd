extends RigidBody2D

signal dead # signal work for move gameover menu

@export
var velocity = 20

@export
var jump_power = -300

var can_jump = true
var alive = true # notify the player is alive

func _ready() -> void:
	linear_velocity.y = jump_power

func die():
	alive = false
	linear_velocity = Vector2.ZERO
	
	for node in get_tree().get_nodes_in_group("Obstacle"):
		node.velocity = 0
		
	for node in get_tree().get_nodes_in_group("BG"):
		node.velocity = 0
	
	dead.emit()
	
	ScoreManager.eroll_score()
	

func _input(event):
	if (Input.is_action_just_pressed("Spacebar") and can_jump and alive): 
		# if player is dead, spacebar won't work
		linear_velocity.y = jump_power
		can_jump = false

func _on_jump_timer_timeout() -> void:
	can_jump = true


func _on_frame_timeout() -> void:
	if $Sprite2D.frame == 3:
		$Sprite2D.frame = 0
	else:
		$Sprite2D.frame += 1
