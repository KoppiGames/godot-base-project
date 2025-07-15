class_name Save
extends Resource

const SAVE_FOLDER := "user://save/"
const SAVE_FILE := SAVE_FOLDER + "save_{INDEX}.json"

# @export var example_variable: int = 0
# Example with sub-resources
# @export var sub_resource: SubResource
# Alternatively, you can save a resource ID instead of the resource itself.
# This needs more setup with constants and resource paths but its a good way to save resources with static data.
# @export var sub_resource_id: StringName

## Returns a new Save resource with default values.
static func get_default() -> Save:
  var default_save := Save.new()
  # Initialize default values for the save
  # default_save.example_variable = 0
  # default_save.sub_resource = SubResource.new()
  # default_save.sub_resource_id = Const.DEFAULT_SUB_RESOURCE_ID
  # Add more default values as needed
  return default_save

## Serializes the Save resource to a dictionary for saving.
func to_dict() -> Dictionary:
  return {
    # "example_variable": example_variable,
    # "sub_resource": null if not sub_resource else sub_resource.to_dict(),
    # "sub_resource_id": sub_resource_id,
    # Add more variables to save as needed
  }

## Loads the Save resource from a dictionary.
func from_dict(dict: Dictionary) -> Resource:
  # Load variables from the dictionary
  # example_variable = dict.get("example_variable", 0)
  # var sub_resource_data = dict.get("sub_resource", null)
  # sub_resource = SubResource.new().from_dict(sub_resource_data) if sub_resource_data else null
  # sub_resource_id = dict.get("sub_resource_id", Const.DEFAULT_SUB_RESOURCE_ID)
  # Add more variables to load as needed
  return self
