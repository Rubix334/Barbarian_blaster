extends Path3D
@onready var timer: Timer = $Timer
@export var enemy_scene : PackedScene
@export var difficulty_manager : Node 
func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = difficulty_manager.get_enemy_health()
	add_child(new_enemy)
	timer.wait_time = difficulty_manager.get_spawn_time()


func _on_timer_timeout() -> void:
	spawn_enemy()
