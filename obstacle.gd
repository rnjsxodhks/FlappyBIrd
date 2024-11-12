extends Node2D

signal crash # custom signal 'crash'

@export
var velocity = 50

func _ready() -> void:
	crash.connect(get_node("../../Player").die) # connect signal 'crash' to Player node
# .. 으로 Obstacles node를, 두번째 .. 으로 Node2D를 거치는 것
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= velocity * delta


func _on_upper_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		crash.emit()

func _on_lower_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		crash.emit()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_score_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		ScoreManager.add_score(1)
