extends Node2D

var obstacle = preload("res://obstacle.tscn") #load 함수도 가능
var accel = 0

func _on_timer_timeout() -> void:
	var child = obstacle.instantiate() # obstacle 변수는 장애물에 관한 메모리 위치 정보만 갖고 있기 때문에 실제로 씬에 배치해주어야 함.
	child.position.y = randi() % 101 - 50
	child.velocity += accel
	add_child(child)
	
func stop_generation():
	$Timer.stop()


func _on_velo_timer_timeout():
	accel += 5
