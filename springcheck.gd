extends Area2D

var f = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var col = get_overlapping_bodies()
	f = false
	for b in col:
		if not f:
			if b.is_in_group("floor"):
				f = true
			else:
				f = false
		else:
			break
	get_parent().floor_check(f)
		
