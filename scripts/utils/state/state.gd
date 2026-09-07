@abstract class_name State
extends Node
## 使用该状态的人物
var _actor_ref: WeakRef
## 使用该状态的状态机
var _state_machine_ref: WeakRef
## 状态初始化
func init(actor: Node, state_machine: Object) -> void:
	_actor_ref = weakref(actor)
	_state_machine_ref = weakref(state_machine)

## 进入状态时调用
@abstract func enter() -> void
## 退出状态时调用
@abstract func exit() -> void

@abstract func process(delta: float) -> void
@abstract func physics_process(delta: float) -> void

# 安全获取角色
func get_actor():
	return _actor_ref.get_ref() if _actor_ref else null

# 安全获取状态机
func get_state_machine():
	return _state_machine_ref.get_ref() if _state_machine_ref else null
