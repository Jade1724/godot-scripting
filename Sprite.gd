extends Sprite

var speed = 400
var angular_speed = PI # Godot angle is in radians by default

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	
