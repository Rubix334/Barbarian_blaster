extends Node

@onready var timer: Timer = $Timer
@export var spawn_time_curve : Curve
@export var game_length := 30
@export var enemy_health_curve : Curve

signal stop_spawning_enemies

func _ready() -> void:
	timer.wait_time = game_length
	timer.start()
	Engine.time_scale = 5
	
func _process(delta: float) -> void:
	#print(get_spawn_time())
	pass

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_length)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())
	
func get_enemy_health() -> float:
	return enemy_health_curve.sample(game_progress_ratio())


func _on_timer_timeout() -> void:
	stop_spawning_enemies.emit()
