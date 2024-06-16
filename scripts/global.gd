extends Node

@onready var ball_scene = preload("res://scenes/ball.tscn")

var lives: int = 3
var score: int
var game_active: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	game_active = true
	score = 0
	lives = 3
	
func ball_offscreen():
	lives -= 1
	if lives <= 0:
		print("game lost")
		game_active = false
	else:
		var ball = ball_scene.instantiate()
		add_child(ball)
		# Only set game_active to true if the game is not over
		if lives > 0:
			game_active = true

func brick_destroyed():
	score += 1
	if score >= 36:
		print("game won")
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_active == false:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/level.tscn")
