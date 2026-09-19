extends CharacterBody3D

@export var gravity = 40.0
@export var run_speed = 8.0
@export var jump_speed = 14.0

@export var acceleration = 30.0
@export var friction = 10.0

@onready var smoke = $Smoke

enum {IDLE, WALK, JUMP}
var state = IDLE

func _ready() -> void:
	change_state(IDLE)
	
func change_state(new_state):
	state = new_state
	match state:
		IDLE:
			$AnimatedSprite3D.play("idle")
		WALK:
			$AnimatedSprite3D.play("walk")
		JUMP:
			$AnimatedSprite3D.play("jump")

func update_state():
	if state == IDLE and velocity.x != 0:
		change_state(WALK)
		
	if state == WALK and velocity.x == 0:
		change_state(IDLE)
		
	if state in [WALK, IDLE] and !is_on_floor():
		change_state(JUMP)
		$Jump.play()
	if state == JUMP and is_on_floor():
		change_state(IDLE)
		
	


func _physics_process(delta) -> void:
	velocity.y -= gravity * delta
	get_input()
	move_and_slide()
	update_state()
	
func get_input():
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_just_pressed("jump")
	
	if right:
		velocity.x = move_toward(velocity.x, run_speed, acceleration * get_physics_process_delta_time())
		$AnimatedSprite3D.flip_h = false
	elif left:
		velocity.x = move_toward(velocity.x, -run_speed, acceleration * get_physics_process_delta_time())
		$AnimatedSprite3D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, friction * get_physics_process_delta_time())
	
	velocity.z = 0
	
	if jump and is_on_floor():
		velocity.y = jump_speed
		print("SMOKE")
		smoke.visible = true
		smoke.play()
		
func _on_smoke_animation_finished():
	smoke.visible = false
