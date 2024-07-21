extends Control

@export var level_name: String
var sound = AudioServer.get_bus_index("Master")

func _on_play_pressed():
	SceneSwitcher.switch_scene(level_name)

func _on_quit_pressed():
	get_tree().quit()

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(sound, value)
