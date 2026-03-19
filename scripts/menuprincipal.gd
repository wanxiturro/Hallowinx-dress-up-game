extends Control

# Referencias a los botones
@onready var play_button = $Play
@onready var settings_button = $Levels
@onready var exit_button = $Exit
@onready var faded = $off/off  
@onready var blooding = $blooding  

var rng = RandomNumberGenerator.new()

var game_scene = preload("res://scenes/game.tscn")

func _ready():
	rng.randomize()
	
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	exit_button.pressed.connect(_on_exit_pressed)

func _on_play_pressed():
	Input.vibrate_handheld(30)
	
	var probabilidad = rng.randf_range(0, 100)
	
	if probabilidad <= 0.3:
		blooding.play("blood")
		await blooding.animation_finished
	else:
		faded.play("off")
		await faded.animation_finished
	cambiar_a_juego()

func _on_settings_pressed():
	Input.vibrate_handheld(20)
	print("Settings - Próximamente")

func _on_exit_pressed():
	Input.vibrate_handheld(20)
	print("Exit - Próximamente")

func cambiar_a_juego():
	get_tree().change_scene_to_packed(game_scene)
