extends Area2D
var instance 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 50
	global_position.x += -speed * delta

func _on_player_crushed() -> void:
	queue_free()
