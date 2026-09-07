extends State

func enter() -> void:
	return
## 退出状态时调用:

func exit() :
	return

func process(_delta: float) -> void:
	return

func physics_process(_delta: float) -> void:
	get_actor().direction = Input.get_vector("left", "right", "up", "down")
	print(get_actor().direction)
	get_actor().position += get_actor().speed * _delta * get_actor().direction
