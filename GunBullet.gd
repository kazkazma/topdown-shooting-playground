class_name GunBullet extends Area2D

const SPEED = 20
const RANGE = 750

var enable = false
var traveled = 0

func _ready():
	pass

func _physics_process(delta):	
	if enable:
		self.position += Vector2.RIGHT.rotated(self.rotation) * SPEED * 60 * delta
		
		traveled += SPEED
		if traveled > RANGE:
			queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
