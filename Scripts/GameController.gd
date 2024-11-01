extends Node

@export var score : int
@export var health : int

@onready var key : bool = false
@onready var interacted : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 3
	$"../FullHealth".visible = true
	$"../Bridge".visible = false
	$"../Bridge/StaticBody2D/CollisionPolygon2D".disabled = true

func _process(delta):
	if key == true:
		$"../Bridge/StaticBody2D/CollisionPolygon2D".disabled = false
	

	
func depleteHealth():
	health = health - 1
	if health == 2:
		$"../FullHealth".visible = false
		$"../HalfHealth".visible = true
	if health == 1:
		$"../HalfHealth".visible = false
		$"../LastLife".visible = true
	if health == 0:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")


func addScore():
	score =  score + 1
	$"../Label".text = str(score)


func _on_level_switch_area_body_entered(body: Node2D) -> void:
	if key == true:
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
