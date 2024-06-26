class_name Gun extends Marker2D

const BULLET = preload("res://GunBullet.tscn")

func _ready():
	pass

func _physics_process(delta):
	look_at(get_global_mouse_position())

func shoot():
	var bullet: GunBullet = BULLET.instantiate()
	
	%BulletContainer.add_child(bullet)
	bullet.enable = true
	bullet.position = $Marker2D.global_position
	bullet.rotation = global_rotation
