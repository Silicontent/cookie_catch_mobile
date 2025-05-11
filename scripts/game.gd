extends Node2D

@onready var hud := $HUD
@onready var controls := $Controls


func show_game() -> void:
	show()
	hud.show()
	controls.show()


func hide_game() -> void:
	hide()
	hud.hide()
	controls.hide()
