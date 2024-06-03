extends Node2D

var peer = ENetMultiplayerPeer.new()
var playing = false
@export var player_scene: PackedScene
 
func _on_death_area_body_entered(body):
	if body.is_in_group("player"):
		queue_free()

func _on_host_button_pressed():
	playing = true
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()

func _on_join_button_pressed():
	playing = true
	peer.create_client("localhost", 135)
	multiplayer.multiplayer_peer = peer
 
func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)
	player.position = Vector2(randf_range(704,1216), 384)
 
func _physics_process(_delta):
	if playing:
		$MultiplayerHUD.visible = false

func _ready():
	randomize()
