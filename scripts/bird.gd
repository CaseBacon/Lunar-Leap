extends RigidBody2D

var og_pos
var waiting = false
var c = 1
var rng = RandomNumberGenerator.new()
var max = 1000

func _ready() -> void:
	og_pos = global_position.y

func _physics_process(_delta: float) -> void:
	if get_tree().get_first_node_in_group("player").checkcan():
		$AnimatedSprite2D.play("default")
		linear_velocity = Vector2(100, 0)
		for b in $Area2D.get_overlapping_bodies():
			if b.is_in_group("limits"):
				if c < 2:
					global_position = Vector2(93, og_pos)
					c += 1
				else:
					new_line()
			break
		for c in $Area2D2.get_overlapping_areas():
			if c.is_in_group("spring"):
				if get_tree().get_first_node_in_group("player").jumpf1 == true:
					$AnimatedSprite2D.visible = false
					$AnimatedSprite2D2.visible = true
					$AnimatedSprite2D2.play("default")
					get_tree().get_first_node_in_group("player").get_child(5).get_child(0).get_child(0).add()
					get_parent().minus(max)
	else:
		linear_velocity = Vector2(0, 0)

func new_line():
	og_pos = rng.randi_range(max - (max-1), max) * -1
	global_position = Vector2(93, og_pos)
	c = 0

func _on_animated_sprite_2d_2_animation_finished() -> void:
	queue_free()

func give_values(y, m):
	og_pos = y*-1
	max = m
	global_position.y = og_pos
	
