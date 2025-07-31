extends CharacterBody2D


@export var SPEED: int = 100
@export var JUMP_VELOCITY: int = -200

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction < 0:
		animated_sprite.flip_h = true
	if direction > 0:
		animated_sprite.flip_h = false

	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle")
	
	if not is_on_floor():
		animated_sprite.play("jump")

	move_and_slide()
