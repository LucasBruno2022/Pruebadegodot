extends Label

var Tecla: InputEventKey
var Pantalla
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	print("Tecla: " ,Tecla.as_text())
	
	pass
