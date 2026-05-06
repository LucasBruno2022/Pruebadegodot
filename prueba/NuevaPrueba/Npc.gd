class_name NPC
extends CharacterBody2D

var contador: int = 0
var Vida: int = 150

func _ready():
	if _on_area_2d_body_shape_entered:
		pass
	
	pass

func _physics_process(_delta):
	
	
	pass

func Hola_mundo():
	print("Hola mundo, soy area2d entraste: ", contador)
	contador += 1
	
	print("Mi vida: ",Vida)
	Vida -= 50
	if Vida < 0:
		Muerte()
	pass

func Muerte():
	print("has muerto")
	
	queue_free()

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Hola_mundo()
	pass # Replace with function body.
