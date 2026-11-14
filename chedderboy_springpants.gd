extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var playersprite = $player
@onready var Playercol = $Playercol
@onready var spring = $spring
@onready var springcol = $Springcol

var scale_spring = 0.25
var og_ss = 0.25
var adjust = 0
var rotting = false
var lr = 1
var xvp = 0
var allowx = false
var friction = 800

func _ready() -> void:
	var scale_spring = spring.scale.y
	var og_ss = scale_spring
	springcol.scale = Vector2(spring.scale.x, spring.scale.y)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		var lr = roundi(Input.get_axis("left", "right"))
		rotation_degrees += lr * 2
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		if not rotting:
			if not (rotation_degrees < 1 and  rotation_degrees > -1):
				if rotation_degrees > 0:
					rotation_degrees += -1 * 2
				else:
					rotation_degrees += 1 * 2
	if Input.is_action_pressed("up"):
		if scale_spring >= 0.1:	
			scale_spring -= 0.01
			spring.position.y =  spring.position.y - scale_spring
			springcol.position.y = springcol.position.y  - scale_spring
	else:
		if og_ss >= scale_spring:
			scale_spring += 0.01
			spring.position.y = spring.position.y + scale_spring
			springcol.position.y = springcol.position.y  + scale_spring
	var lr = roundi(Input.get_axis("left", "right"))
	if lr > 0 or lr < 0:
		if not (rotation_degrees > 75 or rotation_degrees < -75):
			rotting = true
			rotation_degrees += lr * 2
			xvp = rotation_degrees
		else:
			rotting = false
	if Input.is_action_just_released("up") and is_on_floor():
		jump(scale_spring, xvp)
	if spring.scale.y != 0.1:
		spring.scale.y = scale_spring
		springcol.scale.y = scale_spring
	move_and_slide()
	
func jump(s, x):
	velocity = Vector2(x*10, -100 * (10*(1-s)))
	print(velocity)
