extends Node

@onready var ball_scene = preload("res://scenes/ball.tscn")

var save_path = "user://variables.save"

var lives: int = 3
var bricks_destroyed: int
@export var score: int
@export var highscore: int
var game_active: bool = true
var seconds: int

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	game_active = true
	bricks_destroyed = 0
	lives = 3
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(score)
	file.store_var(highscore)
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		score = file.get_var(score)
		highscore = file.get_var(highscore)
	else:
		print("no data saved on disk...")
		score = 0
		highscore = 0
	
func ball_offscreen():
	lives -= 1
	if lives <= 0:
		print("game lost")
		game_active = false
		if score > highscore:
			highscore = score
		save()
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
	else:
		var ball = ball_scene.instantiate()
		add_child(ball)
		# Only set game_active to true if the game is not over
		if lives > 0:
			game_active = true

func brick_destroyed():
	bricks_destroyed += 1
	if seconds != null:
		score += 1000 * 1/seconds
	if seconds == null:
		score += 1000
	if bricks_destroyed >= 36:
		print("game won")
		if score > highscore:
			highscore = score
		save()
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("skip"):
		bricks_destroyed = 35
	if game_active == false:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/level.tscn")
