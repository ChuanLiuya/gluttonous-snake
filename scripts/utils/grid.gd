class_name GridUtils
extends RefCounted
## 网格坐标换算工具（纯静态，全项目复用）
##
## 约定：
## - 每个格子 16×16 像素，场地左上角为像素原点 (0, 0)
## - 格子用整数序号 (列, 行) 表示：第一格是 (0, 0)，它右边一格是 (1, 0)，下面一格是 (0, 1)
## - 格 (col, row) 覆盖的像素范围：col*CELL <= x < (col+1)*CELL，row 同理

## 每格边长（像素）
const CELL := 16


## 像素坐标 → 所在格子序号（向下取整，方便把鼠标点击/随机点吸附到格）
## 例：像素 (17, 5) 属于第 2 列第 1 行 → 返回 (1, 0)
static func pixel_to_grid(pos: Vector2) -> Vector2i:
	return Vector2i(floori(pos.x / CELL), floori(pos.y / CELL))


## 格子序号 → 该格左上角的像素坐标
## 例：格 (1, 0) 的左上角像素是 (16, 0)
static func grid_to_pixel(cell: Vector2i) -> Vector2:
	return Vector2(cell) * CELL


## 格子序号 → 该格中心点的像素坐标（适合作为蛇身/食物的锚点位置）
## 例：格 (1, 0) 的中心像素是 (24, 8)
static func grid_to_pixel_center(cell: Vector2i) -> Vector2:
	return grid_to_pixel(cell) + Vector2(CELL, CELL) * 0.5
