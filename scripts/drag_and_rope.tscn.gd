extends Sprite2D

var dragging : bool = false
var of : Vector2 = Vector2(0,0)
@onready var collision_polygon_2d = $Area2D/CollisionPolygon2D

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - of

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Click en la prenda - comenzar arrastre
			dragging = true
			of = get_global_mouse_position() - position
		else:
			# Soltar click - terminar arrastre (si está arrastrando)
			if dragging:
				dragging = false
				# Aquí puedes añadir lógica para cuando suelta la prenda
				# Por ejemplo: verificar si está en el lugar correcto
				check_drop_position()

func check_drop_position():
	# Aquí puedes verificar dónde se soltó la prenda
	print("Prenda soltada en: ", position)

# Opcional: para asegurarte de que si sueltas el click en cualquier lado
# también se detenga el arrastre
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed and dragging:
			# Si se suelta el click izquierdo en cualquier parte y estamos arrastrando
			dragging = false
			check_drop_position()
