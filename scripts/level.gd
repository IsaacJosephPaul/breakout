extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	global.game_active = true
	global.score = 0
	global.lives = 3
	$gameover_screen.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$lives.text = "Lives: " + str(global.lives)
	if global.game_active == false:
		$gameover_screen.visible = true
	else:
		$gameover_screen.visible = false
