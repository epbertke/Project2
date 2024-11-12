extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var controller = $"../GameController"
	controller.addScore()
	$"../sfx/collect".play()
	print("score increased")
	queue_free()
