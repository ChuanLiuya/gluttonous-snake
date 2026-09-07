extends Sprite2D


var direction :Vector2i = Vector2i(1,0)
var grid_position: Vector2i:
	set(value):
		grid_position = value
		# 将格子坐标转换为像素中心坐标，并赋给节点的 position
		position = GridUtils.grid_to_pixel_center(value)

func _ready() -> void:
	var current_level = get_tree().current_scene
	grid_position = current_level.default_snake_grid_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
