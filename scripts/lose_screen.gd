extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	global.load_data()
	$score.text = "score: " + str(global.score)
	$highscore.text = "highscore: " + str(global.highscore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/level.tscn")
