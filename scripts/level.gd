extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	global.seconds = 1
	global.game_active = true
	global.score = 0
	global.bricks_destroyed = 0
	global.lives = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$lives.text = "Lives: " + str(global.lives)
	$score.text = "Score: " + str(global.score)


func _on_timer_timeout():
	global.seconds += 1
