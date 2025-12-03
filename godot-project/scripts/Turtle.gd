extends CharacterBody2D

const SPEED = 200.0

@onready var collision_shape = $CollisionShape2D

signal game_over
signal win

func _physics_process(delta):
	if position.y < 50:
		emit_signal("win")
		return
	
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	velocity = direction * SPEED
	move_and_slide()
	
	# Check for log collisions
	for body in get_colliding_bodies():
		if body.is_in_group("logs"):
			emit_signal("game_over")