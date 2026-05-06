class_name Practicas
extends Node2D

@export var miSenial: Senial
var Nombres = ["Calamardo", "arenita", "Power Ranger Rojo", "Zack Nyder"]
var Edades = [1 , 2, 3, 4]

# Called when the node enters the scene tree for the first time.
func _ready():
	if miSenial == null:
		miSenial = get_node("Hijo")
		miSenial.laSenial.connect(UnEnter)
	pass # Replace with function body.

func UnEnter():
	print("Recibi la señal [clase Practicas]")
	HOLAMUNDO()
	print("----")
	pass

func HOLAMUNDO():
	print("Hola " + Nombres.pick_random(),": :", Edades.pick_random())
	pass
