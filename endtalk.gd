extends Sprite2D

var l = ["Finally!!!! I reached the moon!", 
"Awh man, the moon is just a rock in space", 
"wait i see some thing on the far East of the moon", 
"you want me to take this cheese?",
"the end.... or is it?"
]

var i = 0
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and i < 4:
		$Label.text = ""
		for char in l[i]:
			var t = $Label.text
			$Label.text = t + char
			await get_tree().create_timer(0.025).timeout
		i += 1
	if i == 4:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file.call_deferred("res://scenes/titlescrn.tscn")
