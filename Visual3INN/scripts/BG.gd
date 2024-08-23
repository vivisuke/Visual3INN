extends ColorRect

const NODE_RADIUS = 30.0
const Y_LINE = 40+20
const LR_SPC = 60
const TOP_SPC = 70
const BTM_SPC = 20
const X_INPUT = 60		# X座標 for 入力層
const X_DIFF = 190
const X_ACT = X_INPUT + X_DIFF
const X_OUTPUT = X_ACT + X_DIFF
const Y_DIFF = 90
const Y_1 = 120
const Y_X1 = Y_1 + Y_DIFF
const Y_X2 = Y_X1 + Y_DIFF
const Y_X3 = Y_X2 + Y_DIFF
const Y_ACT = (Y_X1+Y_X2)/2
const X_WEIGHT = 120
const X_AF = X_ACT+X_DIFF/2

var initialized = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#
	var dy = 50
	var y_w = Y_ACT - 10
	add_label(Vector2(X_WEIGHT, y_w-dy), "*b")
	add_label(Vector2(X_WEIGHT, y_w), "*w1")
	add_label(Vector2(X_WEIGHT, y_w+dy), "*w2")
	add_label(Vector2(X_WEIGHT, y_w+dy*2), "*w3")
	add_label(Vector2(X_AF, y_w), "h()")
	#
	add_label_raw(Vector2(X_INPUT, Y_LINE-24), "Affine")
	add_label_raw(Vector2(X_ACT+15, Y_LINE-24), "Activation Function")
	pass # Replace with function body.

func add_label(pos: Vector2, txt: String):
	var dx = 4 if txt.length() == 1 else 8
	var lbl = Label.new()
	lbl.add_theme_color_override("font_color", Color.BLACK)
	lbl.text = txt
	lbl.position = pos - Vector2(dx, 12)
	add_child(lbl)
func add_label_raw(pos: Vector2, txt: String):
	var lbl = Label.new()
	lbl.add_theme_color_override("font_color", Color.BLACK)
	lbl.text = txt
	lbl.position = pos
	add_child(lbl)
func draw_circle_outline(pos: Vector2, radius, col, txt: String):
	draw_circle(pos, radius, col)
	draw_arc(pos, radius, 0.0, 2*PI, 128, Color.BLACK, 0.75, true)
	if !initialized:
		add_label(pos, txt)
func _draw():
	# エッジ
	draw_line(Vector2(X_INPUT, Y_1), Vector2(X_ACT, Y_ACT), Color.DARK_GRAY)
	draw_line(Vector2(X_INPUT, Y_X1), Vector2(X_ACT, Y_ACT), Color.DARK_GRAY)
	draw_line(Vector2(X_INPUT, Y_X2), Vector2(X_ACT, Y_ACT), Color.DARK_GRAY)
	draw_line(Vector2(X_INPUT, Y_X3), Vector2(X_ACT, Y_ACT), Color.DARK_GRAY)
	draw_line(Vector2(X_ACT, Y_ACT), Vector2(X_OUTPUT, Y_ACT), Color.DARK_GRAY)
	# ノード
	draw_circle_outline(Vector2(X_INPUT, Y_1), NODE_RADIUS, Color("#e0e0e0"), "1")
	draw_circle_outline(Vector2(X_INPUT, Y_X1), NODE_RADIUS, Color.WHITE, "x1")
	draw_circle_outline(Vector2(X_INPUT, Y_X2), NODE_RADIUS, Color.WHITE, "x2")
	draw_circle_outline(Vector2(X_INPUT, Y_X3), NODE_RADIUS, Color.WHITE, "x3")
	draw_circle_outline(Vector2(X_ACT, Y_ACT), NODE_RADIUS, Color.WHITE, "a")
	draw_circle_outline(Vector2(X_OUTPUT, Y_ACT), NODE_RADIUS, Color.WHITE, "y")
	# 上部線
	draw_line(Vector2(X_INPUT-NODE_RADIUS+5, Y_LINE), Vector2(X_ACT-45, Y_LINE), Color.BLACK)
	draw_line(Vector2(X_ACT+5, Y_LINE), Vector2(X_OUTPUT+NODE_RADIUS+25, Y_LINE), Color.BLACK)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
