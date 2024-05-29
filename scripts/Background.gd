extends Sprite2D

@export var backgrounds : Array[CompressedTexture2D]

func _ready():
	texture = backgrounds.pick_random()
