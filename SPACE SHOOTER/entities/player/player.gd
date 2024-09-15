extends Node2D

var bullet_scene = preload("res://entities/bullets/bullet.tscn")
var direction:int = 0
var speed:int = 300
var player_half_width:int = 29
var shoot_time = 1.0
var shoot_counter = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	else:
		direction = 0
		
	var new_x = position.x + direction * speed * delta
	new_x = clamp(new_x, player_half_width, get_viewport_rect().size.x - player_half_width)
	position.x = new_x
	
	shoot_counter += delta
	if Input.is_action_pressed("shoot") and shoot_counter>shoot_time:
		shoot_counter = 0
		var bullet_instance:Node = bullet_scene.instantiate()
		bullet_instance.position.x = position.x
		bullet_instance.position.y = position.y-50
		get_parent().get_node("Bullets").add_child(bullet_instance)
	
	
		
