extends CharacterBody2D
class_name Bichote
@export var UnJugador: Jugador
var direccion_actual
var direccion = [Vector2.ZERO, Vector2.LEFT, Vector2.RIGHT, Vector2.DOWN, Vector2.UP]
var SPEED = 50
var Perseguir: bool = false
var secuencia = ["up", "down", "left", "right"]
var indice = 0
var encantado: bool = false
func _ready():
	Direccion_aleatoria()
	pass

func _physics_process(_delta):
	if encantado == true:
		velocity = Vector2.ZERO
	
	elif Perseguir:
		velocity = (UnJugador.global_position - global_position).normalized() * SPEED
	
	else:
		velocity = direccion_actual * SPEED
	move_and_slide()

func Direccion_aleatoria():
	direccion_actual = direccion.pick_random()
	await get_tree().create_timer(1.7).timeout
	Direccion_aleatoria()
	pass


func obtener_secuencia():
	return secuencia


func siguiente_nota(nota):
	print("Recibí:", nota)

	if nota == secuencia[indice]:
		print("Bien!")

		indice += 1

		if indice >= secuencia.size():
			print("SECUENCIA COMPLETA")
			encantar()
			indice = 0

	else:
		print("Mal")
		fallar()
		indice = 0

func encantar():
	print("El Criptido está encantado")
	encantado = true

func fallar():
	print("El Criptido se enoja")

func _on_area_del_bicho_area_entered(area):
	Perseguir = true
	
	if UnJugador:
		print("algo entro, Nombre: ", UnJugador.MiNombre())
	
	pass # Replace with function body.


func _on_area_del_bicho_area_exited(area):
	Perseguir = false
	pass # Replace with function body.
