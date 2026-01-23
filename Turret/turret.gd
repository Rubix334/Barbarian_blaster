extends Node3D

var projectile = preload("res://Turret/projectile.tscn")
var enemy_path : Path3D
var target : Node3D

@export var turret_range = 10.0

func _physics_process(_delta: float) -> void:
	target = find_best_target()
	if target != null:
		look_at(target.global_position,Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target != null:
		var new_projectile = projectile.instantiate()
		add_child(new_projectile)
		new_projectile.global_position = global_position
		new_projectile.direction = basis.z

func find_best_target() -> Enemy:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is Enemy:
			if enemy.progress > best_progress:
				var distance = global_position.distance_to(enemy.global_position)
				if distance <= turret_range:
					best_target = enemy
					best_progress = enemy.progress
	return best_target
