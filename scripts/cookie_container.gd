extends Node2D

@export var cookie: PackedScene

# TODO: add more cookie types
var cookie_types := [
	# color palette, fall speed, score value
	["res://assets/cookie/palettes/common_palette.png", 2, 1],
	["res://assets/cookie/palettes/uncommon_palette.png", 2, 5],
	["res://assets/cookie/palettes/rare_palette.png", 3, 8],
	["res://assets/cookie/palettes/legendary_palette.png", 4, 12],
]


func determine_cookie_type() -> Array:
	# TODO: add weighted spawn options
	return cookie_types[randi_range(0, len(cookie_types) - 1)]


func _on_spawn_timer_timeout() -> void:
	var c: Cookie = cookie.instantiate()
	var type: Array = determine_cookie_type()
	
	c.palette = type[0]
	# makes every cookie slightly slower or faster than every other,
	# even if they are of the same type
	c.speed = randf_range(type[1] - 0.2, type[1] + 0.2)
	c.score = type[2]
	
	# put cookie at a random X on the container's Y-level
	c.global_position = Vector2(
		randi_range(0, ProjectSettings.get_setting("display/window/size/viewport_width", 1280)),
		global_position.y
	)
	
	add_child(c)
