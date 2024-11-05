extends Area2D
var instance 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 50
	global_position.x += -speed * delta

func _on_body_entered(body):
	print("Enemy crushed:", self.name)
	queue_free()


func _on_player_crushed_3() -> void:
	print("crushed enemy:", self.name)
	queue_free() # Replace with function body.
