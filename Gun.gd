class_name GunMuzzle extends Marker2D

func _ready():
	pass

func _physics_process(delta):
	look_at(get_global_mouse_position())

func shoot():
	# const BULLET = preload("res://GunBullet.tscn")
	# var bullet: GunBullet = BULLET.instantiate()
	var bullet: GunBullet = %GunBullet.duplicate()
	
	%BulletContainer.add_child(bullet)
	bullet.enable = true
	bullet.position = $Marker2D.global_position
	bullet.rotation = global_rotation
