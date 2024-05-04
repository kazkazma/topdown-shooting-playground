class_name Enemy extends CharacterBody2D

const SPEED = 5

@onready var navigator: NavigationAgent2D = $NavigationAgent2D
@onready var attack_target: CharacterBody2D = get_node("/root/Main/%Player")

var enable = false

var is_bouncing = false
var colliding_time = 0

func _ready():
	#navigator.path_postprocessing = NavigationPathQueryParameters2D.PATH_POSTPROCESSING_EDGECENTERED
	pass

func _physics_process(delta):	
	# TODO: 狀態機化
	if enable:
		if not is_bouncing:
			navigator.target_position = attack_target.global_position
			var direction = global_position.direction_to(navigator.get_next_path_position())
		
			velocity = direction * SPEED
			var collide = move_and_collide(velocity * 60 * delta)
			
			if collide:
				is_bouncing = true
				velocity = velocity.bounce(collide.get_normal())	
			
		elif is_bouncing:
			move_and_collide(velocity * 60 * delta)
			
			colliding_time += delta
			if colliding_time > 0.1:
				is_bouncing = false
				colliding_time = 0
		
	$Line2D.points[1] = velocity.normalized() * 100
	
func take_damage():
	queue_free()
	var game = get_node("/root/Main/%Control")
	game.score += 1
