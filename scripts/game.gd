extends Node2D

@onready var vestidos = $Vestidos
@onready var medias = $Medias
@onready var zapatos = $Zapatos
@onready var skin_1 = $skins/skin_1
@onready var skin_2 = $skins/skin_2
@onready var skin_3 = $skins/skin_3
@onready var skin_4 = $skins/skin_4
@onready var skin_5 = $skins/skin_5
@onready var skin_6 = $skins/skin_6

#PELOS FRONT
@onready var pelos_front = [
	$"pelos_front/pelo_1", 
	$"pelos_front/pelo_2",  
	$"pelos_front/pelo_3",  
	$"pelos_front/pelo_4",  
	$"pelos_front/pelo_5",  
	$"pelos_front/pelo_6", 
	$"pelos_front/pelo_7"
]
#PELOS BACK 
@onready var pelos_back = [
	$"pelos_back/pelo_1", 
	$"pelos_back/pelo_2", 
	$"pelos_back/pelo_3", 
	$"pelos_back/pelo_4", 
	$"pelos_back/pelo_5", 
	$"pelos_back/pelo_6", 
	$"pelos_back/pelo_7"
]

@onready var ojos = [
	$"ojos/ojos_1", 
	$"ojos/ojos_2", 
	$"ojos/ojos_3", 
	$"ojos/ojos_4", 
	$"ojos/ojos_5", 
	$"ojos/ojos_6"
]

@onready var cejas = [
	$"cejas/cejas_1", 
	$"cejas/cejas_2", 
	$"cejas/cejas_3", 
	$"cejas/cejas_4", 
	$"cejas/cejas_5", 
	$"cejas/cejas_6"
]

@onready var labios = [
	$"labios/labios_1",
	$"labios/labios_2",
	$"labios/labios_3",
	$"labios/labios_4",
	$"labios/labios_5",
	$"labios/labios_6"
]


var skin_actual = 1
var pelo_actual = 0
var ojo_actual = 0
var ceja_actual = 0
var labio_actual = 0

func _ready():
	mostrar_solo_skin(1)
	
	for i in range(7):
		pelos_front[i].visible = false
		pelos_back[i].visible = false
	pelos_front[0].visible = true
	pelos_back[0].visible = true
	
	# Inicializar ojos
	for ojo in ojos:
		ojo.visible = false
	ojos[0].visible = true
	
	# Inicializar cejas
	for ceja in cejas:
		ceja.visible = false
	cejas[0].visible = true
	
	# Inicializar labios
	for labio in labios:
		labio.visible = false
	labios[0].visible = true

func _process(delta):
	pass

func _on_button_pressed():
	vestidos.visible = not vestidos.visible
	
	if vestidos.visible:
		print("Vestidos MOSTRADOS")
	else:
		print("Vestidos OCULTADOS")

func _on_button_2_pressed():
	medias.visible = not medias.visible
	
	if medias.visible:
		print("Medias MOSTRADOS")
	else:
		print("Medias OCULTADOS")

func _on_buttom_zapatos_pressed():
	zapatos.visible = not zapatos.visible
	
	if zapatos.visible:
		print("Medias MOSTRADOS")
	else:
		print("Medias OCULTADOS")


func _on_buttom_skins_pressed():
	skin_actual += 1
	
	if skin_actual > 6:
		skin_actual = 1
	
	mostrar_solo_skin(skin_actual)
	
func mostrar_solo_skin(numero):
	skin_1.visible = false
	skin_2.visible = false
	skin_3.visible = false
	skin_4.visible = false
	skin_5.visible = false
	skin_6.visible = false
	
	# Mostrar la skin seleccionada
	match numero:
		1:
			skin_1.visible = true
		2:
			skin_2.visible = true
		3:
			skin_3.visible = true
		4:
			skin_4.visible = true
		5:
			skin_5.visible = true
		6:
			skin_6.visible = true


func _on_buttom_pelos_pressed():
	# Ocultar pelo actual
	pelos_front[pelo_actual].visible = false
	pelos_back[pelo_actual].visible = false
	
	# Avanzar al siguiente (con ciclo)
	pelo_actual = (pelo_actual + 1) % 7
	
	# Mostrar nuevo pelo
	pelos_front[pelo_actual].visible = true
	pelos_back[pelo_actual].visible = true

func _on_buttom_ojos_pressed():
	ojos[ojo_actual].visible = false
	
	ojo_actual = (ojo_actual + 1) % 6
	
	ojos[ojo_actual].visible = true


func _on_buttom_cejas_pressed():
	cejas[ceja_actual].visible = false
	
	ceja_actual = (ceja_actual + 1) % 6
	
	cejas[ceja_actual].visible = true


func _on_buttom_labios_pressed():
	labios[labio_actual].visible = false
	
	labio_actual = (labio_actual + 1) % 6
	
	labios[labio_actual].visible = true
