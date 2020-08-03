extends "res://engine/entity.gd"

var movetimer_len = 30
var movetimer = 0

func _init():
	speed = 0
	damage = 0.5
	
func _ready():
	$ani.play("default")
	movedir = dir.randDir()

func _physics_process(delta):
	damage_loop()
	movement_loop()
	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.randDir()
		movetimer = movetimer_len
