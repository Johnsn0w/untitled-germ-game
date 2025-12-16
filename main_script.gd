extends Node2D

var test_dictionary = {"key_1": "value of key 1", "key_2": "value of key 2"}


	


func _ready() -> void:
	print(
		test_dictionary["key_1"]
		
	)


func get_random_spawn_data() -> Dictionary:
	var screen_size = get_viewport().get_visible_rect().size
	var edge = randi() % 4
	
	var position: Vector2
	var velocity: Vector2
	var speed = randf_range(100.0, 500.0)
	var angle = randf_range(50.0, 100)
	
	match edge:
		0: # Left to Right
			position = Vector2(-50, randf_range(0, screen_size.y))
			velocity = Vector2(speed, angle)
		1: # Right to Left
			position = Vector2(screen_size.x + 50, randf_range(0, screen_size.y))
			velocity = Vector2(-speed, angle)
		2: # Top to Bottom
			position = Vector2(randf_range(0, screen_size.x), -50)
			velocity = Vector2(angle, speed)
		3: # Bottom to Top
			position = Vector2(randf_range(0, screen_size.x), screen_size.y + 50)
			velocity = Vector2(angle, -speed)
			
	return {
		"position": position,
		"velocity": velocity
	}

func spawn_enemy() -> void:
	var new_enemy = EnemyScript.new()
	var spawn_data = get_random_spawn_data()
	new_enemy.position = spawn_data.position
	new_enemy.velocity = spawn_data.velocity
	add_child(new_enemy)
	print("enemy spawned at %s with velocity %s" % [new_enemy.position, new_enemy.velocity])


	
func _process(_delta: float) -> void:
	pass

# Initial test spawn
# func spawn_enemy() -> void:
#	@warning_ignore("unused_variable")
#	var new_enemy = EnemyScript.new()
#	new_enemy.position = Vector2(50,50)
#	add_child(new_enemy)
#	print("enemy spawn")

func _on_timer_timeout() -> void:
	if GlobalVars.current_number_of_enemies < GlobalVars.max_enemies:
		spawn_enemy()
