extends Sprite

signal health_depleted

var health = 10
var speed = 400
var angular_speed = PI # Godot angle is in radians by default

func _process(delta: float) -> void:
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_Button_pressed():
	set_process(not is_processing()) # Replace with function body.

func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")
	
func _on_Timer_timeout():
	visible = not visible

func take_damage(amount):
	health -= amount
	if health <= 0:
		emit_signal("health_depleted")
