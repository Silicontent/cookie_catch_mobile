'''
POTENTIAL UPGRADES/POWERS

- collection bowls: stationary cookie catches that lie below the main jar
- find a way to incorporate both score and jar capacity (deposit cookies into score?)
- 
'''


class_name Jar
extends CharacterBody2D

# visual showing how full the jar is 
@onready var fill_sprite := $FillMask/FillSprite

const SPEED := 350.0
# gets raw player input
var control_dir := 0
# used for moving the jar, factors in player input, speed, and acceleration/friction
var move_dir := 0.0


func _physics_process(delta: float) -> void:
	move(delta)


# MOVEMENT ====================================================================
func _on_move_left_pressed() -> void:
	control_dir = -1

func _on_move_right_pressed() -> void:
	control_dir = 1

func _on_move_released() -> void:
	control_dir = 0


func move(delta: float) -> void:
	# apply accleration/friction to the jar
	move_dir = lerp(move_dir, float(control_dir), 0.15)
	# apply speed to the movement direction and move the jar
	velocity = Vector2(move_dir * SPEED * 100 * delta, 0)
	move_and_slide()


func _on_screen_exited() -> void:
	# warp the jar to the opposite side of the screen
	if global_position.x > ProjectSettings.get_setting("display/window/size/viewport_width", 1280):
		global_position.x = -46
	elif global_position.x < 0:
		global_position.x = ProjectSettings.get_setting("display/window/size/viewport_width", 1280) + 46


# COLLECTION ==================================================================
func update_fill() -> void:
	# (max_fill - cookie_amt) makes the fill sprite rise up to the top
	# rather than falling down from the bottom
	fill_sprite.target_y = (((Globals.max_fill - Globals.cookie_amt) / Globals.max_fill)) * 27.0


func collect_cookie(score: int) -> void:
	Globals.cookie_amt += 1.0
	Globals.score_to_collect += score
	update_fill()


func _on_opening_area_entered(area: Area2D) -> void:
	# collect a cookie if it collides with the jar's opening
	# and there is still room in the jar
	if area is Cookie and Globals.cookie_amt < Globals.max_fill:
		collect_cookie(area.score)
		area.queue_free()


func _on_deposit_button_pressed() -> void:
	Globals.cookie_amt = 0
	update_fill()
