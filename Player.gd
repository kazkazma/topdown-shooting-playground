class_name Player extends CharacterBody2D

const SPEED = 1000
var health: int = 5
@onready var healeh_ui = $TextureProgressBar

func _ready():
	pass

func _process(delta):
	if visible:
		if Input.is_action_just_pressed("shoot"):
			var gun = get_node_or_null("Gun")
			if gun != null:
				gun.shoot()

func _physics_process(delta):
	if visible:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		self.velocity = direction * SPEED
		move_and_slide()
		
	healeh_ui.value = health

func _on_hit_box_body_entered(body):
	if body is Enemy:
		body.queue_free()
			
		health -= 1
		if health <= 0:
			visible = false
