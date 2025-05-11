class_name Cookie
extends Area2D

@onready var sprite := $Sprite2D

# color palette (differentiates between different tiers)
var palette: String
# fall speed
var speed := 2.0
# how much the score increases when collected
var score := 1


func _ready() -> void:
	self.score = score
	self.speed = speed
	sprite.material.set("shader_parameter/palette", load(palette))


func _physics_process(delta: float) -> void:
	# make the cookie fall from the top of the screen
	global_position.y += (speed * 100.0) * delta


func _on_screen_exited() -> void:
	# remove uncollected cookies that leave the screen
	queue_free()
