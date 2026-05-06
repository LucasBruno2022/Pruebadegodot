extends Node2D

class_name Senial
signal laSenial

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if Input.is_action_just_pressed("Aceptado"):
		print("EMITI la señal [clase senial]")
		laSenial.emit()
	pass # Replace with function body.
	
