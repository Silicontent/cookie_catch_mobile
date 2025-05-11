extends Node

@onready var game := $Game
@onready var shop := $Shop

@onready var fade_anim := $Fader/AnimationPlayer


func _ready() -> void:
	# very ugly ngl
	$Game/HUD/MarginContainer/HBoxContainer/ShopButton.connect("pressed", _on_shop_button_pressed)
	$Shop/MarginContainer/ShopContainer/HeaderContainer/HBoxContainer2/BackButton.connect("pressed", _on_back_button_pressed)


# SCREEN NAVIGATION ===========================================================
func _on_shop_button_pressed() -> void:
	fade_anim.play_backwards("fade")
	await fade_anim.animation_finished
	
	get_tree().paused = true
	shop.update_score()
	shop.show()
	game.hide_game()
	
	fade_anim.play("fade")


func _on_back_button_pressed() -> void:
	fade_anim.play_backwards("fade")
	await fade_anim.animation_finished
	
	get_tree().paused = false
	shop.hide()
	game.show_game()
	
	fade_anim.play("fade")
