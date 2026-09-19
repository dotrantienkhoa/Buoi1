extends Node3D

func _init() -> void:
	pass

func _ready() -> void:
	var sprite3d = Sprite3D.new()
	sprite3d.texture = load("res://assets/terrain/palm_tree.png")
	sprite3d.pixel_size = 0.0625
	sprite3d.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	sprite3d.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	sprite3d.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	add_child(sprite3d)
	sprite3d.position = Vector3(2.0, 4.06, 5.0)
	
	var sprite3d2 = Sprite3D.new()
	sprite3d2.texture = load("res://assets/terrain/palm_tree.png")
	sprite3d2.pixel_size = 0.0625
	sprite3d2.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	sprite3d2.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	sprite3d2.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	add_child(sprite3d2)
	sprite3d2.position = Vector3(10.0, 4.06, 5.0)
	sprite3d2.scale = Vector3(1.2, 1, 1)
	pass

func _process(delta) -> void:
	pass
