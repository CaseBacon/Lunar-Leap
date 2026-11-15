extends Control

@onready var up1 = $up1
@onready var up2 = $up2
@onready var up3 = $up3
@onready var up1title = $up1/title
@onready var up2title = $up2/title
@onready var up3title = $up3/title
@onready var up1description = $up1/description
@onready var up2description = $up2/description
@onready var up3description = $up3/description
@onready var player = get_parent().get_parent().get_parent()

var C_upgrades = ["jump height", "spring size", "more XP", "more enemys"]
var C_upgrades_desc = ["makes you jump higher.", "makes your spring bigger.", "provides more xp per kill", "spawns more enemys to jump off."]
var R_upgrades = ["jumps", "coil time"]
var R_upgrades_desc = ["adds an extra jump.", "reduces the time to coil the spring"]
var up1ind = 0
var up2ind = 0
var up3ind = 0
var up1r = 0
var up2r = 0
var up3r = 0
var random = RandomNumberGenerator.new()
var ind = 0
var rarity = 0
@onready var C_funcs = []
@onready var R_funcs = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	var player = get_parent().get_parent().get_parent()
	C_funcs = [player.add_height, player.spring_size_inc, player.more_xp, player.more_enemys]
	R_funcs = [player.jumps_add, player.coil_time_dec]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func upgrade():
	show()
	player.cant()
	rarity = get_rar()
	for i in range(3):
		if i == 0:
			if rarity == 1:
				ind = random.randi_range(0, len(R_upgrades)-1)
				up1title.text = R_upgrades[ind]
				up1description.text = R_upgrades_desc[ind]
			if rarity == 0:
				ind = random.randi_range(0, len(C_upgrades)-1)
				up1title.text = C_upgrades[ind]
				up1description.text = C_upgrades_desc[ind]
			up1ind = ind
			up1r = rarity
		if i == 1:
			if rarity == 1:
				ind = random.randi_range(0, len(R_upgrades)-1)
				up2title.text = R_upgrades[ind]
				up2description.text = R_upgrades_desc[ind]
			if rarity == 0:
				ind = random.randi_range(0, len(C_upgrades)-1)
				up2title.text = C_upgrades[ind]
				up2description.text = C_upgrades_desc[ind]
			up2ind = ind
			up3r = rarity
		if i == 2:
			if rarity == 1:
				ind = random.randi_range(0, len(R_upgrades)-1)
				up3title.text = R_upgrades[ind]
				up3description.text = R_upgrades_desc[ind]
			if rarity == 0:
				ind = random.randi_range(0, len(C_upgrades)-1)
				up3title.text = C_upgrades[ind]
				up3description.text = C_upgrades_desc[ind]
			up3ind = ind
			up3r = rarity
		print(ind)
			
func get_rar():
	if random.randi_range(1, 100) > 80:
		return 1
	else:
		return 0


func _on_up_1_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print(up1r)
		if up1r == 0:
			C_funcs[up1ind].call()
		if up1r == 1:
			R_funcs[up1ind].call()
		reset()

func _on_up_2_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print(up2r)
		if up2r == 0:
			C_funcs[up2ind].call()
		if up2r == 1:
			R_funcs[up2ind].call()
		reset()

func _on_up_3_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print(up3r)
		if up3r == 0:
			C_funcs[up3ind].call()
		if up3r == 1:
			R_funcs[up3ind].call()
		reset()
	

func reset():
	hide()
	player.cancan()
