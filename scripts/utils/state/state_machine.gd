# state_machine.gd
extends Node
class_name StateMachine

# =========== 要填充的内容 =======================

## 所有状态的字典
@export var _states: Dictionary = {}
## 初始状态
@export var _default_state_key : String= 'idle'


## 当前正在运行的状态
var current_state: State = null
## 使用该状态机的角色
var _actor: Node = null

# ============ 生命周期 ============

func _ready() -> void:
	# 获取宿主节点
	_actor = get_parent()
	change_state(_states[_default_state_key])

func _process(delta: float) -> void:
	if current_state:
		current_state.process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_process(delta)


## 切换到指定状态
func change_state(new_state: State) -> void:
	if new_state == current_state:
		return
	
	var previous = current_state
	
	# 退出旧状态
	if previous:
		previous.exit()
	
	# 进入新状态
	current_state = new_state
	if current_state:
		current_state.enter(previous)

## 通过键名切换到指定状态
func change_state_by_key(key: String) -> bool:
	if not _states.has(key):
		push_error("StateMachine: 状态键 '%s' 不存在！" % key)
		return false
	
	change_state(_states[key])
	return true

## 获取当前状态的键名
func get_current_state_key() -> String:
	for key in _states:
		if _states[key] == current_state:
			return key
	return ""

## 检查当前是否处于某个状态
func is_in_state(key: String) -> bool:
	return _states.get(key) == current_state
