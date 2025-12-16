extends Node

func _ready() -> void:
	print("test scene running")
	
	print(Vector2.UP)
	print(Vector2.DOWN)
	print(Vector2.LEFT)
	print(Vector2.RIGHT)
	
	#
	#await get_tree().create_timer(0.3).timeout
	#get_tree().quit()
