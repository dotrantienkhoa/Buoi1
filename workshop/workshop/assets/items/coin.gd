extends Area3D


func _ready() -> void:
	$AnimatedSprite3D.play("default")
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	$AudioStreamPlayer3D.play()
	$CollisionShape3D.set_deferred("disabled", true)

	# Coin bay lên
	var tween = create_tween()

	tween.set_parallel(true)

	# Bay lên 1 đơn vị
	tween.tween_property(
		self,
		"position:y",
		position.y + 1.0,
		0.3
	)

	# Nhỏ dần
	tween.tween_property(
		$AnimatedSprite3D,
		"scale",
		Vector3.ZERO,
		0.3
	)

	# Chờ hiệu ứng bay xong
	await tween.finished

	queue_free()
