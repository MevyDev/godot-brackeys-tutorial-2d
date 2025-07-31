extends Node

@onready var coin_text: Label = $CoinText

var score = 0

func add_point():
	score += 1
	coin_text.text = "You collected " + str(score) + " coins!"
	print(score)
