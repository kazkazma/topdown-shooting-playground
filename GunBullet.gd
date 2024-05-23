class_name GunBullet extends StaticBody2D

const SPEED = 1000	# pixel/s
const RANGE = 750

var enable = false
var traveled = 0

func _ready():
	pass

func _physics_process(delta):	
	if enable:
		var travel_distance = SPEED * delta
		self.position += Vector2.RIGHT.rotated(self.rotation) * travel_distance
			
		traveled += travel_distance
		if traveled > RANGE:
			queue_free()

func _on_body_entered(body):
	queue_free()
