class_name GlobalAccess
extends Node

var rng: RandomNumberGenerator

@export_category("Run")
# @export var run: Run
# @export var run_scene: RunController

func _ready() -> void:
  rng = RandomNumberGenerator.new()

# func generate_seed() -> void:
#   if run.seed:
#     rng.seed = run.seed
#   else:
#     rng.randomize()
#     rng.seed = randi() % 1000000000000
#     run.seed = rng.seed