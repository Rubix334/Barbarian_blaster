extends Node3D
class_name TurretManager

@export var turret : PackedScene

@export var enemy_path : Path3D

func build_turret(position:Vector3) -> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = position
	new_turret.enemy_path = enemy_path
