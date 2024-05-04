extends Node2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_timer_timeout():
	# const ENEMY = preload("res://Enemy.tscn")
	# var enemy: Enemy = ENEMY.instantiate()	
	var enemy = %Enemy.duplicate()
	
	add_child(enemy)
	#enemy.attack_target = %Player
	enemy.global_position = ensure_spawn_position()
	enemy.enable = true	

	
func ensure_spawn_position() -> Vector2:
	var spawn_position: Vector2
	while true:
		spawn_position = Vector2(randf_range(64, 2368), randf_range(64, 1920))
		
		var parameters = PhysicsPointQueryParameters2D.new()
		parameters.position = spawn_position
		parameters.collide_with_areas = true		
		var intersects = get_world_2d().direct_space_state.intersect_point(
			parameters
		)		
		if intersects.size() == 0:
			break
	return spawn_position
