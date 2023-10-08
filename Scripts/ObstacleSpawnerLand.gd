extends Node2D 

# var obstacle_scene = preload("res://Scenes/Land/LandObstacle.tscn")  # Replace with your obstacle scene path

@export var obstacle_scene: PackedScene

var spawn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	spawn = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	if spawn:
		var obstacle = obstacle_scene.instantiate()
		obstacle.position = Vector2(350, 5)
		obstacle.x_speed += 10
		add_child(obstacle)
		
		

func _on_area_2d_area_entered(area):
	if area.name == "CasaBodyArea":
		$PlayerCarpincho.canJump = false
		print('choco pared')

	if area.name == "Score":
		print('puntone')
