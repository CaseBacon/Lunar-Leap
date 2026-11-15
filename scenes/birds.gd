extends Node2D

var count0 = 0
var amount0 = 3
var count1 = 0
var amount1 = 6
var count2 = 0
var amount2 = 3

var rng = RandomNumberGenerator.new()
var bird = preload("res://scenes/bird.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if amount0 >= count0:
		if rng.randi_range(1, 50) == 1:
			print("added bird")
			count0 += 1
			var b = bird.instantiate()
			add_child(b)
			b.give_values(randi_range(1, 200), 200)
			b.add_to_group("floor")
	if amount1 >= count1:
		if rng.randi_range(1, 100) == 1:
			print("added bird")
			count1 += 1
			var b = bird.instantiate()
			add_child(b)
			b.give_values(randi_range(1, 1000), 1000)
			b.add_to_group("floor")
	if amount2 >= count2:
		if rng.randi_range(1, 100) == 1:
			print("added bird")
			count2 += 1
			var b = bird.instantiate()
			add_child(b)
			b.give_values(randi_range(1000, 2000), 2000)
			b.add_to_group("floor")

func minus(m):
	if m == 1000:
		count1 -= 1
	if m == 2000:
		count2 -= 1
