extends Node2D

@export var force = 40
@export var jumpforce = 800
@export_color_no_alpha var playercolor
var can_jump = true
@export var player_id := 1:
	set(id):
		player_id = id
		%InputSynchronizer.set_multiplayer_authority(id)

func _ready():
	%HeadTexture.modulate = playercolor
	%LeftArmTexture.modulate = playercolor
	%RightArmTexture.modulate = playercolor

func _physics_process(_delta):
	if Input.is_action_pressed("left"):
		$LeftArm.apply_central_impulse(Vector2(-force,0))
	if Input.is_action_pressed("right"):
		$RightArm.apply_central_impulse(Vector2(force,0))
	if Input.is_action_just_pressed("jump"):
		if can_jump:
			$Head.apply_central_impulse(Vector2(0,-jumpforce))
			can_jump = false
			$JumpTimer.start()

func _on_jump_timer_timeout():
	can_jump = true

func _enter_tree():
	set_multiplayer_authority(name.to_int())
