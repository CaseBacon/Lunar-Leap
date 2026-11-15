extends TextureRect


var s_add
var s_limit = 3
var s_og
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	s_add = scale.x / s_limit
	s_og = scale.x
	scale.x = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add():
	scale.x += s_add
	if scale.x >= s_og:
		scale.x = 0
		var up_menu = get_parent().get_child(1)
		up_menu.upgrade()
		s_limit = s_limit * 1.2
	
