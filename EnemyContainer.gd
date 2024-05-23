extends Node2D

const ENEMY = preload("res://Enemy.tscn")

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_timer_timeout():	
	var enemy: Enemy = ENEMY.instantiate()	
	
	add_child(enemy)
	#enemy.attack_target = %Player
	enemy.global_position = ensure_spawn_position()
	enemy.enable = true	

	
func ensure_spawn_position() -> Vector2:
	var spawn_position: Vector2
	while true:
		var spawn_area = get_node_or_null("%Camera/EnemySpawnArea/CollisionShape2D")
		var spawn_area_center = spawn_area.global_position
		var spawn_area_size = spawn_area.shape.size
		
		spawn_position = Vector2(
			randf_range(
				spawn_area_center.x - spawn_area_size.x / 2, 
				spawn_area_center.x + spawn_area_size.x / 2
			), 
			randf_range(
				spawn_area_center.y - spawn_area_size.y / 2, 
				spawn_area_center.y + spawn_area_size.y / 2
			)
		)
		
		var parameters = PhysicsPointQueryParameters2D.new()
		parameters.position = spawn_position
		parameters.collide_with_areas = true
		var intersects = get_world_2d().direct_space_state.intersect_point(
			parameters
		)		
		#if intersects.size() == 2:
			#break
		break
	return spawn_position
