extends MarginContainer
@onready var label: Label = $Label
@export var starting_gold := 150
var gold : int:
	set(new_amt):
		gold = max(0,new_amt) #will take any number from 0 to new_amt to prevent it from going negative
		label.text = "Gold: "+str(gold)

func _ready() -> void:
	gold = starting_gold
