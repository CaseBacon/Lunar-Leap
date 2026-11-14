extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var playersprite = $player
@onready var Playercol = $Playercol
@onready var spring = $spring
@onready var springcol = $Springcol
@onready var xpbar = $"Camera2D/CanvasLayer/Xp bar"
@onready var spring_check = $springcheck

var scale_spring = 0.25
var og_ss = 0.25
var adjust = 0
var rotting = false
var lr = 1
var xvp = 0
var allowx = false
var friction = 2000
var can = true
var jh = 0
var jumps = 1
var jump_limit = 1
var cs = 0.01
var jumping = false
var floor = false

func _ready() -> void:
	var scale_spring = spring.scale.y
	var og_ss = scale_spring
	springcol.scale = Vector2(spring.scale.x, spring.scale.y)
	
func _physics_process(delta: float) -> void:
	print(floor)
	if can:
		if not is_on_floor():
			if not jumping:
				jumps = 0
			velocity += get_gravity() * delta
			var lr = roundi(Input.get_axis("left", "right"))
			rotation_degrees += lr * 2
		else:
			velocity.x = move_toward(velocity.x, 0, friction * delta)
			if floor:
				jumping = true
				jumps = jump_limit
			if not rotting:
				if not (rotation_degrees < 1 and  rotation_degrees > -1):
					if rotation_degrees > 0:
						rotation_degrees += -1 * 2
					else:
						rotation_degrees += 1 * 2
		if Input.is_action_pressed("up"):
			if scale_spring >= 0.1:	
				scale_spring -= cs
				spring.position.y =  spring.position.y - scale_spring
				springcol.position.y = springcol.position.y  - scale_spring
				spring_check.position.y = springcol.position.y  - scale_spring
		else:
			if og_ss >= scale_spring:
				scale_spring += cs
				spring.position.y = spring.position.y + scale_spring
				springcol.position.y = springcol.position.y  + scale_spring
				spring_check.position.y = springcol.position.y  + scale_spring
		var lr = roundi(Input.get_axis("left", "right"))
		if lr > 0 or lr < 0:
			if not (rotation_degrees > 75 or rotation_degrees < -75):
				rotting = true
				rotation_degrees += lr * 2
		else:
			rotting = false
		xvp = rotation_degrees
		if Input.is_action_just_released("up") and jumps >= 1:
			jump(scale_spring, xvp)
		if spring.scale.y != 0.1:
			spring.scale.y = scale_spring
			springcol.scale.y = scale_spring
			spring_check.scale.y = scale_spring+ 0.01
		xvp = 0
		move_and_slide()
	
func jump(s, x):
	jumping = true
	velocity = Vector2(x*(0.8-s+og_ss)*10, -100 * (10*(0.8-s+og_ss)-(abs(x)/50) + jh))
	jumps -= 1
	print(velocity)

func cant():
	can = false

func cancan():
	can = true

func add_height():
	jh += 2
	print(jh)

func spring_size_inc():
	og_ss += 0.15
	springcol.scale.x += 0.1
	spring.scale.x += 0.1
	spring_check.scale.x += 0.11
	print(scale.x)
	
func more_xp():
	xpbar.s_limit = xpbar.s_limit / 2

func more_enemys():
	pass

func jumps_add():
	jump_limit += 1

func coil_time_dec():
	cs += 0.01

func floor_check(f):
	floor = f
