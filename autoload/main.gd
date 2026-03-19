extends Node

var game_state = {
	"memories_unlocked": [],
	"clothes_owned": ["dress_pink", "bow_red", "shoes_white"],
	"creepy_level": 0,
	"lily_mood": "happy"
}

signal creepy_level_changed(level)

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func add_creepy_level(amount):
	game_state.creepy_level += amount
	emit_signal("creepy_level_changed", game_state.creepy_level)
	
func unlock_memory(memory_id):
	if not memory_id in game_state.memories_unlocked:
		game_state.memories_unlocked.append(memory_id)
