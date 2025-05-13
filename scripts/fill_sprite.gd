extends Sprite2D

# the Y-level where this sprite is not visible
const EMPTY_Y := 27.0
# the Y-level to be at
var target_y := 0.0


func _ready() -> void:
	target_y = EMPTY_Y


func _physics_process(_delta: float) -> void:
	# by moving this sprite this way, it acts almost like a percentage bar,
	# showing the percentage of the jar that is filled
	position.y = lerp(position.y, target_y, 0.1)
