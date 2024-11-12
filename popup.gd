extends TextureRect

func _ready() -> void:
	position.y = 400
	
func display():
	if (ScoreManager.score == ScoreManager.best_score):
		$Label.text = "New Best!"
	
	var tween = create_tween() # Tween은 코드 단계에서 부드러운 애니메이션을 적용할 때 편리한
	# 기능을 제공한다.
	tween.tween_property(self, "position:y", 40, 2).set_trans(Tween.TRANS_BACK)
	# (적용 대상, 변화를 줄 옵션 (하위 옵션은 :로 구분), 목표값, 적용 시간)
	# .set_trans(애니메이션 효과)
	await tween.finished # 애니메이션이 끝날 때까지 기다린다. (비동기 프로그램)
	
	

func _on_re_button_up() -> void:
	get_tree().reload_current_scene()
	ScoreManager.init()
