class_name NPCGun extends Marker2D

const BULLET = preload("res://GunBullet.tscn")

func _ready():
	pass

func _physics_process(delta):
	if get_parent().focus_body != null:
		look_at(get_parent().focus_body.global_position)

func shoot():
	var bullet: GunBullet = BULLET.instantiate()
	
	%BulletContainer.add_child(bullet)
	bullet.enable = true
	bullet.position = $Marker2D.global_position
	bullet.rotation = global_rotation

func _on_timer_timeout():
	shoot()
	pass # Replace with function body.
