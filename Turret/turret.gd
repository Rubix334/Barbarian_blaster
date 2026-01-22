extends Node3D

var projectile = preload("res://Turret/projectile.tscn")
var enemy_path : Path3D

func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position,Vector3.UP, true)

func _on_timer_timeout() -> void:
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = global_position
