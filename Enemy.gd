class_name Enemy extends CharacterBody2D

const SPEED = 300	# pixel/s

@onready var navigator: NavigationAgent2D = $NavigationAgent2D
@onready var attack_target: CharacterBody2D = get_node("/root/Main/%Player")

var enable = false

var colliding_time = 0

func _ready():
	pass

func _physics_process(delta):	
	if enable:
		navigator.target_position = attack_target.global_position
		var direction = global_position.direction_to(navigator.get_next_path_position())
		self.velocity = direction * SPEED
		var collide = move_and_collide(velocity * delta)
		
	$Line2D.points[1] = velocity.normalized() * 100
	
func taken_damage():
	queue_free()
	var game = get_node("/root/Main/%Control")
	game.score += 1

func _on_hit_box_body_entered(body):
	if body is GunBullet:
		taken_damage()
		body.queue_free()
