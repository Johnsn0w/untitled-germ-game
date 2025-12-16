extends CharacterBody2D


func _physics_process(_delta: float) -> void:
	var vel : Vector2 = (get_global_mouse_position() - global_position)
	velocity = vel
	move_and_slide()

#func _process(_delta) -> void:
	#if Input.is_action_just_pressed("move left"):
		#position.x -= 50
	#if Input.is_action_just_pressed("move right"):
		#position.x += 50
