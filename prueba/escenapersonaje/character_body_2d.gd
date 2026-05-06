class_name Bicho
extends CharacterBody2D



@export var Recibido: EscMain
var interaccion_max: int = 0
var Cambio: bool = false
var direccion_actual
var direccion = [Vector2.ZERO, Vector2.LEFT, Vector2.RIGHT, Vector2.DOWN, Vector2.UP]
var SPEED = 50
var Perseguir
@export var Player: Node2D

func _ready():
	if Recibido:
		Recibido.Entrada.connect(EstadoDeSenial)
		print("tocaste E")
	
	Direccion_aleatoria()
	pass

func _physics_process(_delta):
	if Cambio == false:
		velocity = direccion_actual * SPEED
		
	else:
		Perseguir = (Player.global_position - global_position).normalized()
		velocity = Perseguir * SPEED
	
	move_and_slide()



func Direccion_aleatoria():
	direccion_actual = direccion.pick_random()
	await get_tree().create_timer(1.7).timeout
	Direccion_aleatoria()
	pass

func EstadoDeSenial():
	interaccion_max += 1
	print("interacción: ", interaccion_max)
	print("---")
	if interaccion_max %2 == 1:
		Cambio = true
	
	else:
		Cambio = false
		Direccion_aleatoria()
	
	if interaccion_max > 1:
		interaccion_max = 0
	
	
	pass
