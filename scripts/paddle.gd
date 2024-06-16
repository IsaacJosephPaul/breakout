extends CharacterBody2D

var SPEED: int = 600

func _ready():
	pass
func player():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):	
		if position.x > -489:
			position.x -= SPEED * delta
	if Input.is_action_pressed("ui_right"):	
		if position.x < 489:
			position.x += SPEED * delta
