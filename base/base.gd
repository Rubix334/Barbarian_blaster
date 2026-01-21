extends Node3D
class_name Base

@export var max_health := 5
var health : int:
	set(new_health):
		health = new_health
		text.text = str(health)+"/"+str(max_health)
		var red : Color = Color.RED
		var white : Color = Color.WHITE
		
		text.modulate = red.lerp(white, float(health)/float(max_health))
		
		if health <= 0:
			get_tree().reload_current_scene()

@onready var text : Label3D = $Label3D

func _ready() -> void:
	health = max_health

func take_damage() -> void:
	health -= 1
	print("damage taken by base")
