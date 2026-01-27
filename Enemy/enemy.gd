extends PathFollow3D
class_name Enemy
## The speed in m/s the enemy will move
@export var speed :float = 10.0

@onready var base : Base = get_tree().get_first_node_in_group("base")
@onready var bank := get_tree().get_first_node_in_group("bank")

@export var max_health := 50

@export var gold_reward := 25

var health : int:
	set(new_health):
		if health > new_health:
			$AnimationPlayer.play("take_damage")
		health = new_health
		if health <= 0:
			bank.gold += gold_reward
			queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		queue_free()
	
