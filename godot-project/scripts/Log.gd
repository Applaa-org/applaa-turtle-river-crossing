extends CharacterBody2D

@export var speed = 100.0
@export var direction = 1  # 1 for right to left, -1 for left to right

func _physics_process(delta):
	velocity.x = speed * direction
	move_and_slide()
	
	# Wrap around screen
	if position.x > 1380:
		position.x = -100
	elif position.x < -100:
		position.x = 1380