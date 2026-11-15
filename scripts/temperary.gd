extends Camera2D

@export var speed: float = 400.0

func _process(delta: float) -> void:
	var direction := Input.get_axis("ui_up", "ui_down")
	position.y += direction * speed * delta
