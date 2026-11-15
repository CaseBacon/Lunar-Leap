extends Sprite2D

var lines = ["Ever since i was a child, i dreamed of a moon made of cheese, my mum always told me to reach for the stars and find what i love.", 
"Today is the day, im going to finally find my moon of cheese with my new springs and rock hard abs, anything is possible!! "]
var i = 0.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and i < 2:
		$Label.text = ""
		for char in lines[i]:
			var t = $Label.text
			$Label.text = t + char
			await get_tree().create_timer(0.025).timeout
		i += 1
	if i == 2:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file.call_deferred("res://scenes/level_new.tscn")
