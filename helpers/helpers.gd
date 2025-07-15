class_name Helpers
extends Node

static func clear_all_children(node: Node) -> void:
  for child in node.get_children():
    child.queue_free()

static func connect_signal(node: Node, signal_name: StringName, method: Callable) -> void:
  if not node.is_connected(signal_name, method):
    node.connect(signal_name, method.bind())

static func disconnect_signal(node: Node, signal_name: StringName, method: Callable) -> void:
  if node.is_connected(signal_name, method):
    node.disconnect(signal_name, method)

static func calc_percentage(current_val: int, max_val: int) -> float:
  if max_val == 0:
    return 0.0
  return clamp(float(current_val) / float(max_val) * 100.0, 0.0, 100.0)