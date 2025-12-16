extends CharacterBody2D

class_name EnemyScript



#var velocity: Vector2
var screen_rect: Rect2

func _init() -> void:
	GlobalVars.current_number_of_enemies += 1
	var enemy_sprite = Sprite2D.new()
	var enemy_collider = CollisionShape2D.new()
	var enemy_shape    = RectangleShape2D.new()
	enemy_shape.size = Vector2(100,100)
	enemy_collider.shape = enemy_shape
	add_child(enemy_collider)
	enemy_sprite.texture = load("res://icon.svg")
	enemy_sprite.self_modulate = Color.DARK_RED
	add_child(enemy_sprite)
	print("hello from enemy")

# Called when the node enters the scene tree for the first time.
func _ready():
	var rect = get_viewport().get_visible_rect()
	var margin = 100 # extra space outside screen
	screen_rect = Rect2(
		rect.position - Vector2(margin, margin),
		rect.size + Vector2(margin * 2, margin *2)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	if not screen_rect.has_point(position):
		GlobalVars.current_number_of_enemies -= 1
		queue_free()
