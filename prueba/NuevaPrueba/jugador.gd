extends CharacterBody2D
class_name  Jugador
var Direccion
var velocidad = 150
var Nombre: String = "Lucas"
var InputFlechas = []
var criptido_actual = null

func _ready():
	
	pass

func _physics_process(_delta):
	Direccion = Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	
	DetectarInput()
	
	if Direccion:
		velocity = Direccion * velocidad
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	



func DetectarInput():
	if Input.is_action_just_pressed("ui_up"):
		enviar_input("up")
	
	if Input.is_action_just_pressed("ui_down"):
		enviar_input("down")
	
	if Input.is_action_just_pressed("ui_left"):
		enviar_input("left")
	
	if Input.is_action_just_pressed("ui_right"):
		enviar_input("right")



func MiNombre():
	return Nombre

func enviar_input(nota):
	if criptido_actual != null:
		criptido_actual.siguiente_nota(nota)
	


func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Bichote:
		criptido_actual = collider
		print("Entraste en rango de un Criptido")

		var secuencia = criptido_actual.obtener_secuencia()
		print("Secuencia:", secuencia)


func _on_area_2d_area_exited(area):
	if area.get_parent() == criptido_actual:
		print("Saliste del rango del Criptido")
		criptido_actual = null
