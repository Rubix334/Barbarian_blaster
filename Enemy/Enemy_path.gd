extends Path3D

@export var enemy_scene : PackedScene

func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)
	new_enemy.progress_ratio = 0


func _on_timer_timeout() -> void:
	spawn_enemy()
