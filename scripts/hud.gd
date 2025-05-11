extends CanvasLayer

const BTN_NORMAL_THEME := preload("res://assets/ui/button_normal.tres")
const BTN_HIGHLIGHT_THEME := preload("res://assets/ui/button_highlight.tres")


@onready var deposit_btn := $MarginContainer/HBoxContainer/DepositButton
# label that shows the current score
@onready var score_display := $MarginContainer/ScoreDisplay


func _ready() -> void:
	score_display.text = Globals.add_commas_to_num(Globals.score)


func _process(_delta: float) -> void:
	# highlights the deposit button when the jar is full
	# TODO: change so that this doesn't occur on every frame (potential performance impact idk)
	if Globals.cookie_amt >= Globals.max_fill:
		deposit_btn.theme = BTN_HIGHLIGHT_THEME


# DEPOSITING ==================================================================
func _on_deposit_button_pressed() -> void:
	Globals.score += Globals.score_to_collect
	Globals.score_to_collect = 0
	score_display.text = Globals.add_commas_to_num(Globals.score)
	
	# return deposit button to normal look (if look has changed)
	deposit_btn.theme = BTN_NORMAL_THEME
