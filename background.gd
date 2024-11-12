extends Sprite2D

@export
var velocity = 15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	region_rect.position.x += velocity * delta


func _on_velo_timer_timeout() -> void:
	velocity += 5
