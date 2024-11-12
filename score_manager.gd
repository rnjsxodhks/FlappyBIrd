extends Node

var score = 0
var best_score = 0

func eroll_score():
	if (score > best_score):
		best_score = score

func add_score(value):
	score += 1

func init():
	score = 0

func _ready():
	LoadData()

func _notification(what): 
# _notification 함수는 _ready, _process 같은 함수들이
# 호출됨을 감지하거나 게임이 꺼지는 등의 이벤트를 감지할 수 있다.
	match what: # match 구문은 뒤에 오는 변수의 값(상수)에 따라 분기를 해주는 역할을 하며
	# 일반적으로 if-elif 구조보다 빠른 편이다.
		NOTIFICATION_WM_CLOSE_REQUEST, NOTIFICATION_WM_GO_BACK_REQUEST:
			SaveData()

func SaveData():
	
	var savefile = FileAccess.open("user://flappy_bird_data.save", FileAccess.WRITE) 
	# 리소스를 load 또는 preload 할 때 썼던 res://라는 경로는 엔진에서 테스트하는 단계에서만
	# 유효하기 때문에 일반적으로는 해당 user:// 경로를 쓰는 것을 추천한다.
	#
	# 파일 모드를 WRITE로 하면 해당 경로에 파일이 없을 시 새로 생성한다.
	var json = JSON.stringify({"best_score": best_score}) 
	# Dictionary 형태의 데이터를 
	# 텍스트 파일로 저장할 수 있게 변환.
	
	savefile.store_line(json) # 파일에 직접 저장.

func LoadData():
	
	if FileAccess.file_exists("user://flappy_bird_data.save"): # 파일이 존재할 때만 데이터를
	# 데이터 불러오기를 시도한다.
		
		var savefile = FileAccess.open("user://flappy_bird_data.save", FileAccess.READ)
		var data = savefile.get_line() # 저장할 때 한 줄로 저장하므로 읽을 때도 한 줄씩 읽는다.
		
		var json = JSON.new()
		json.parse(data) # 텍스트 데이터를 Dictionary 형태로 변환.
		
		var gets = json.get_data()
		
		if gets.has("best_score"): 
		# 파일이 존재는 하는데 비어있다면 best_score key에 접근할 때
		# 오류를 내뱉을 것이므로 해당 key가 있는지 검증한다.
			best_score = gets["best_score"] # key가 있다면 데이터 불러오기
	print(best_score)
