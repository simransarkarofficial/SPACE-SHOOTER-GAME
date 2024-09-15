extends Node

var enemy_scene = preload("res://entities/enemies/enemy.tscn")
var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Boundary").connect("area_entered",_the_end)
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3
	timer.connect("timeout",_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	_create_enemy()

func _the_end(body:Node):
	if body is Enemy:
		get_tree().set_pause(true)
	
	
func _create_enemy():
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
