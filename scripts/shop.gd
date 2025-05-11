extends Control

@onready var header := $MarginContainer/ShopContainer/HeaderContainer/Header


func update_score() -> void:
	header.text = "SHOP - " + Globals.add_commas_to_num(Globals.score)
