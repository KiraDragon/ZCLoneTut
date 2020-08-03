extends "res://engine/entity.gd"

var state = "default"
var keys = 0

func _init():
	speed = 70
	TYPE = "PLAYER"
	MAXHEALTH = 4
	health = MAXHEALTH

func _physics_process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
	keys = min(keys, 9)

func state_default():
	controls_loop()
	damage_loop()
	movement_loop()
	spritedir_loop()
	if is_on_wall():
		if spritedir == "Left" and test_move(transform, dir.LEFT):
			ani_switch("push")
		if spritedir == "Right" and test_move(transform, dir.RIGHT):
			ani_switch("push")
		if spritedir == "Up" and test_move(transform, dir.UP):
			ani_switch("push")
		if spritedir == "Down" and test_move(transform, dir.DOWN):
			ani_switch("push")
	elif movedir != dir.CENTER:
		ani_switch("walk")
	else:
		ani_switch("idle")
	if Input.is_action_just_pressed("a"):
		use_item(preload("res://items/sword.tscn"))

func state_swing():
	ani_switch("idle")
	movement_loop()
	damage_loop()
	movedir = dir.CENTER

func controls_loop():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	#If both keys are held, the player stays in place. Since the int is added up
	movedir.x = -int(left) + int(right) #if left is pressed, int is -1, if right is pressed, int is +1, 
	movedir.y = -int(up) + int(down) #if up is pressed, int is -1, if down is pressed, int is +1

