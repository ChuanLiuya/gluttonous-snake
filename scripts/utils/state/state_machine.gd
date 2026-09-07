# state_machine.gd
extends Node
class_name StateMachine

## 当前状态
var current_state: State = null
## 所有状态字典，键为状态节点的名称（String）
var _states: Dictionary = {}
## 初始状态名称
@export var initial_state: String = ""
var _actor : Node
func _ready() -> void:
	_actor = get_parent()
	for child in get_children():
		if child is State:
			child.init(_actor, self)
			_states[child.name] = child
	current_state = _states[initial_state]
	current_state.enter()


## 切换到指定名称的状态
func change_state(new_state_name: String) -> void:
	if not _states.has(new_state_name):
		push_error("State '", new_state_name, "' not found!")
		return

	var new_state = _states[new_state_name]
	if new_state == current_state:
		return

	# 退出当前状态
	if current_state and current_state.has_method("exit"):
		current_state.exit()

	# 切换并进入新状态
	current_state = new_state
	current_state.enter()   # 传入旧状态和自定义数据

## 获取状态（对外提供查询）
func get_state(state_name: String) -> State:
	return _states.get(state_name, null)

## 转发处理函数
func _process(delta: float) -> void:
		current_state.process(delta)

func _physics_process(delta: float) -> void:
		current_state.physics_process(delta)
