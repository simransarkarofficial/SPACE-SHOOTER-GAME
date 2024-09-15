class_name Enemy
extends Area2D

var enemy_speed:int = 80


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position = Vector2(randf_range(10,400-10),0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += enemy_speed*delta 
	


func _on_area_entered(area):
	if area.name=="BulletArea":
		area.get_parent().queue_free()
		queue_free()
