extends Camera3D



@onready var raycast_3d: RayCast3D = $RayCast3D
@export var turret_manger : TurretManager
@export var gridmap : GridMap

@onready var bank := get_tree().get_first_node_in_group('bank')
@export_enum("easy","medium","hard") var difficulty : String
var tower_dict = {"easy":50,"medium":100,"hard":150}
var tower_cost : int

func _ready() -> void:
	tower_cost = tower_dict[difficulty]

func _process(delta: float) -> void:
	var mouse_pos : Vector2 = get_viewport().get_mouse_position()
	raycast_3d.target_position = project_local_ray_normal(mouse_pos) * 100.0
	#update the raycast immediately
	raycast_3d.force_raycast_update()
	
	if raycast_3d.is_colliding():
		var collider = raycast_3d.get_collider()
		if collider is GridMap:
			var collision_point = raycast_3d.get_collision_point()
			var cell = gridmap.local_to_map(collision_point)
			if gridmap.get_cell_item(cell) == 0 and bank.gold >= tower_cost:
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				if Input.is_action_just_pressed("click"):
					gridmap.set_cell_item(cell, 1)
					var tile_pos = gridmap.map_to_local(cell)
					turret_manger.build_turret(tile_pos)
					bank.gold -= tower_cost
			else:
				Input.set_default_cursor_shape(Input.CURSOR_ARROW)
