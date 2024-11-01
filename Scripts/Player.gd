extends CharacterBody2D
signal crushed


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	
	if abs(velocity.x) > .1 and $AnimatedSprite2D.animation != "walk":
		$AnimatedSprite2D.play("walk")
	elif abs(velocity.x) < .1 and $AnimatedSprite2D.animation != "idle":
		$AnimatedSprite2D.play("idle")
		
		
	if(velocity.x > 0):
		$AnimatedSprite2D.scale.x = -1
	elif (velocity.x < 0):
		$AnimatedSprite2D.scale.x = 1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x =  direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_enemy_body_entered(body: Node2D) -> void:
	var controller = $"../GameController"
	if velocity.y > 0:
		crushed.emit()
		controller.addScore()
	else:
		controller.depleteHealth()


#func _on_ladder_body_entered(body: Node2D) -> void:
#	if Input.is_action_just_pressed("climb"):
#		velocity.y = move_toward(velocity.y, 0, SPEED)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if $"../GameController".key == true:
		$"../Bridge".visible = true
	if $"../GameController".interacted <= 1:
		$"../Npc".visible = true
	$"../Interact/Timer".start()
	$"../GameController".interacted += 1
	

func _on_timer_timeout() -> void:
	$"../Npc".visible = false
