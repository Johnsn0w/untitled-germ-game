extends Node2D

# Aaron test for sync

var max_enemies = 3
@export var enemy_spawn_interval: float
var current_number_of_enemies: int

func _ready() -> void:
	print("hello from main")
	
func _process(_delta: float) -> void:
	pass

func spawn_enemy() -> void:
	@warning_ignore("unused_variable")
	var new_enemy = EnemyScript.new()
	new_enemy.position = Vector2(50,50)
	add_child(new_enemy)
	print("enemy spawn")

func _on_timer_timeout() -> void:
	if MainScript.current_number_of_enemies < MainScript.max_enemies:
		spawn_enemy()
