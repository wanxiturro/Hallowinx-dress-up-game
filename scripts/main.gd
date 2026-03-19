extends Control

@onready var lily_sprite = $LilyContainer/LilySprite
@onready var clothes_container = $ClothesPanel/GridContainer
@onready var memory_popup = $MemoryPopup

func _ready():
	setup_ui_sizes()
	load_initial_clothes()
	
func setup_ui_sizes():
	# Ajustar todo para pantallas táctiles
	var screen_size = get_viewport().get_visible_rect().size
	
	# El panel de ropa ocupa 40% de la pantalla (abajo)
	$ClothesPanel.custom_minimum_size.y = screen_size.y * 0.4
	
	# Lily ocupa 60% (arriba)
	$LilyContainer.custom_minimum_size.y = screen_size.y * 0.6
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			handle_touch(event.position)
