extends Node2D


const UFO_SCENE = preload("res://scenes/enemies/ufo.tscn")


const WAIT_TIME = 4.0
const WAIT_VARIATION = 0.5


@onready var spawn_timer: Timer = $SpawnTimer
@onready var paths: Node2D = $Paths


var _paths: Array[Path2D] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for path in paths.get_children():
		_paths.append(path)
	reset_timer()


func reset_timer() -> void:
	SpaceUtils.set_and_start_timer(spawn_timer, WAIT_TIME, WAIT_VARIATION)


func spawn_ufo() -> void:
	var ufo: UFO = UFO_SCENE.instantiate()
	var path: Path2D = _paths.pick_random()
	path.add_child(ufo)
	reset_timer()


func _on_spawn_timer_timeout() -> void:
	spawn_ufo()
