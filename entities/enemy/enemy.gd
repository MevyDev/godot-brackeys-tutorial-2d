extends Node2D

@export var speed = 1

var direction = 1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animatable_body = $AnimatedSprite2D

func _process(delta: float) -> void:
	if(ray_cast_left.is_colliding()):
		direction = 1
		animatable_body.flip_h = false
	if(ray_cast_right.is_colliding()):
		direction = -1
		animatable_body.flip_h = true
	position.x += speed * delta * direction
