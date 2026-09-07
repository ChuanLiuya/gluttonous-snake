extends State


var beat_manager : Timer


func init(actor: Node, state_machine: Object) -> void:
	super.init(actor, state_machine)
	beat_manager = get_tree().get_first_node_in_group("beat_manager") as Timer
	beat_manager.timeout.connect(_on_beat_)

func enter() -> void:
	return
## 退出状态时调用:

func exit() :
	return

func process(_delta: float) -> void:
	return

func physics_process(_delta: float) -> void:
	get_actor().direction = Input.get_vector("left", "right", "up", "down")

func _on_beat_():
	get_actor().grid_position += get_actor().direction
	return
	
