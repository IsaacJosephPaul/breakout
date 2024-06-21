extends RigidBody2D

var SPEED = 300
var pos = Vector2(0, 0)
var accel = 1.2
var initial_impulse = Vector2(randi_range(-300,300), -300)
var force_multiplier = 1.1

# Called when the node enters the scene tree for the first time.
func _ready():
	ball_start()

func ball_start():
	self.linear_damp = 0
	self.angular_damp = 0
	contact_monitor = true
	max_contacts_reported = 50
	position = Vector2(0, 0)
	linear_velocity = initial_impulse

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 350:
		print("game over")
		global.ball_offscreen()
		queue_free()
func _physics_process(delta):
	var speed = linear_velocity.length()
	if speed < 400:
		linear_velocity = linear_velocity.normalized() * 400

func _on_body_entered(body):
	if body.has_method("brick"):
		print("brick collide")
		SPEED *= accel
		body.queue_free()
		global.brick_destroyed()
		$explode.play()
		if global.bricks_destroyed >= 36:
			self.queue_free()
	elif body.has_method("player"):
		print("paddle collide")
		if force_multiplier < 1.8:
			force_multiplier += 0.1
		var force = Vector2(0, -1) * force_multiplier
		if linear_velocity.length() < 900:
			self.apply_central_impulse(force)
		$blip.play()
	else:
		$blip.play()
