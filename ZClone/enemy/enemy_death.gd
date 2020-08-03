extends Node2D

func _ready():
	$ani.play("default")
	$ani.connect("animation_finished", self, "destroy")

func destroy(animation):
	queue_free()
