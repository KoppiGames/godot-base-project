## Manages game save system including load, write, and slot selection.
class_name ResourceSaveManager
extends Node

## Number of save slots supported
const SAVE_AMOUNTS = 3

## Currently selected save index
static var selected_save_index: int

## Currently selected save data
static var selected_save: Save

## Dictionary of all loaded saves by index
static var saves: Dictionary[int, Save] = {}

## Called when the node is added to the scene. Initializes all save slots.
func _ready() -> void:
  load_saves()

## Selects and returns the save associated with the given index.
func select_save(index: int) -> Save:
  selected_save_index = index
  selected_save = saves[selected_save_index]
  return selected_save

# Returns the file path for the given save slot index.
static func _get_save_path(index: int = selected_save_index) -> String:
  return Save.SAVE_FILE.replace("{INDEX}", str(index))

## Serializes and writes the given Save resource to disk as JSON.
static func write_save(resource: Save) -> void:
  Events.saving_game.emit()

  var save_path = _get_save_path()
  
  # Ensure save directory exists
  if not DirAccess.dir_exists_absolute(Save.SAVE_FOLDER):
    DirAccess.make_dir_absolute(Save.SAVE_FOLDER)
  
  var save_file = FileAccess.open(save_path, FileAccess.WRITE)
  
  # Convert save data to dictionary format before writing
  if not resource.has_method("to_dict"):
    print("The save resource is missing a 'to_dict()' function.")
    return
  
  var data = resource.to_dict()
  var json_string = JSON.stringify(data)
  save_file.store_line(json_string)

## Returns true if a save file exists for the given index.
static func save_exists(index: int) -> bool:
  var save_path = _get_save_path(index)
  return ResourceLoader.exists(save_path)

## Loads and returns a Save resource from disk for the given index.
static func load_save(index: int) -> Resource:
  var save: Save
  var save_path = _get_save_path(index)

  if not FileAccess.file_exists(save_path):
    push_error("Error loading game, file not found")
    return
  
  var save_file = FileAccess.open(save_path, FileAccess.READ)
  var json_string = save_file.get_line()

  var json = JSON.new()
  var parse_result = json.parse(json_string)
  
  if not parse_result == OK:
    push_error("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
    return

  var data = json.data
  save = Save.new().from_dict(data)
  return save

## Loads all save slots into memory.
static func load_saves() -> void:
  for index in range(SAVE_AMOUNTS):
    saves[index] = null
    if save_exists(index):
      saves[index] = load_save(index)

## Creates a new save or loads an existing one at the given index.
func create_or_load_save(index: int) -> Save:
  selected_save_index = index
  var data: Save

  if saves[index] != null:
    # Save already loaded in memory
    data = saves[index]
  elif save_exists(index):
    # Load existing save from disk
    Events.loading_save.emit()
    data = load_save(index)
  else:
    # Create a new default save if none exists
    data = Save.get_default()
    write_save(data)

  saves[index] = data
  select_save(index)
  return data

## Deletes the save file at the specified index.
static func delete_save(index: int) -> void:
  if not save_exists(index):
    return

  Events.deleting_save.emit()
  DirAccess.remove_absolute(Save.SAVE_FILE.replace("{INDEX}", str(index)))
