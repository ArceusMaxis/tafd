extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"


func _on_host_game_pressed():
	MultiplayerManager.host_game()


func _on_join_game_pressed():
	MultiplayerManager.join_game()
