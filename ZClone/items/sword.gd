extends Node2D

var TYPE = null
var damage = 0.5
var max_amount = 1

func _ready():
	TYPE = get_parent().TYPE
	$ani.connect("animation_finished", self, "destroy")
	$ani.play(str("swing", get_parent().spritedir))
	if get_parent().has_method("state_swing"):
		get_parent().state = "swing"
	
func destroy(animation):
	if get_parent().has_method("state_swing"):
		get_parent().state = "default"
	queue_free()

