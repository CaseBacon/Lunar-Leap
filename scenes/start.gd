extends TextureButton


var moving = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		get_tree().get_first_node_in_group("movingcam").position.y += 10
		if get_tree().get_first_node_in_group("movingcam").position.y >= get_tree().get_first_node_in_group("movingcam").limit_bottom:
			pass
		


func _on_pressed() -> void:
	moving = true
