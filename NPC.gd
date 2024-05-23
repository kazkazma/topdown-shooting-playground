class_name NPC extends CharacterBody2D

@onready var navigator: NavigationAgent2D = $NavigationAgent2D
@onready var focus_body: CharacterBody2D = %Player

const SPEED = 300

enum State { FOLLOW, ATTACK }
var state: State = State.FOLLOW

func _physics_process(delta):
	if state == State.FOLLOW:
		navigator.target_position = %Player/FollowPoint.global_position
		var direction = global_position.direction_to(navigator.get_next_path_position())
		self.velocity = direction * SPEED
		if (global_position - navigator.target_position).length() > 10:
			move_and_slide()
	if state == State.ATTACK:
		if focus_body == null:
			state = State.FOLLOW
			focus_body = %Player
			$Gun/Timer.stop()

func _on_search_area_body_entered(body):
	if state == State.FOLLOW:
		state = State.ATTACK
		focus_body = body
		$Gun/Timer.start()
