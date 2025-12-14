extends Node2D

class_name EnemyScript


func _init() -> void:
	MainScript.current_number_of_enemies += 1
	print(MainScript.current_number_of_enemies)
	print(MainScript.max_enemies)
	print()
	var enemy_sprite = Sprite2D.new()
	enemy_sprite.texture = load("res://icon.svg")
	enemy_sprite.self_modulate = Color.DARK_RED
	add_child(enemy_sprite)
	print("hello from enemy")
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
