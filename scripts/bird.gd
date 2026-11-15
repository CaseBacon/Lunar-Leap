extends RigidBody2D

var og_pos
var waiting = false

func _ready() -> void:
	og_pos = global_position.y

func _physics_process(_delta: float) -> void:
	$AnimatedSprite2D.play("default")
	linear_velocity = Vector2(100, 0)
	for b in $Area2D.get_overlapping_bodies():
		if b.is_in_group("limits"):
			global_position = Vector2(93, og_pos)
	for c in $Area2D2.get_overlapping_areas():
		if c.is_in_group("spring"):
			print(c)
			if get_tree().get_first_node_in_group("player").jumpf1 == true:
				$AnimatedSprite2D.visible = false
				$AnimatedSprite2D2.visible = true
				$AnimatedSprite2D2.play("default")
				get_tree().get_first_node_in_group("player").get_child(5).get_child(0).get_child(0).add()


func _on_animated_sprite_2d_2_animation_finished() -> void:
	queue_free()
