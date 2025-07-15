# Godot Base Project

A starter template for quickly bootstrapping new Godot projects. This base includes essential systems and tools commonly used in game development, aiming to reduce setup time and help maintain consistent project architecture.

## Included Features

### 🔌 Addons

- [**GodotSteam**](https://godotsteam.com/)  
  Integration for Steamworks features, ready to be configured with your game.

- [**Quiver Analytics**](https://quiver.dev/analytics/)  
  Plug-and-play game analytics for tracking in-game metrics.

### 🗂 Global Structure

- **Events**  
  A centralized event bus (`Autoload`) for decoupled communication across your game.
  
- **Global Access**  
  Includes a shared random number generator (`rng`) and optional logic for generating seeds per game run.
  
- **Save Manager**  
  Handles save/load functionality, with support for managing save files via custom resources.
  
- **Save Resource**  
  The main resource used to persist game data.

### 🛠 Helpers

Utility functions available via `Helpers.function(...)`:

- `clear_all_children(node: Node)`  
  Removes all children nodes from the given parent.

- `connect_signal(node: Node, signal_name: StringName, method: Callable)`  
  Connects a signal if it's not already connected.

- `disconnect_signal(node: Node, signal_name: StringName, method: Callable)`  
  Disconnects a signal if it's currently connected.

- `calc_percentage(current_val: int, max_val: int)`  
  Calculates the percentage value (0–100) between a current and max value.

### ⚙️ Project Settings

All relevant project settings are pre-configured:

- Autoloads
- Display settings
- Debug settings

You can freely modify them to fit your own project needs.

## 🚀 Getting Started

1. Fork this repository to your GitHub account.

2. Clone your forked repository:
   ```bash
   git clone https://github.com/your-username/godot-base-project.git
   ```

3. Open the project in Godot.

4. Customize the global systems and save structures to suit your game.

## 🛠 Customization Tips

- Replace or extend the `Save` resource to match your data model.
- Adjust `SaveManager` logic for custom slot handling or encryption.
- Configure the `GlobalAccess` seed logic for roguelike or procedural runs.
- Enable or disable Addons in `project.godot` as needed.

---

Feel free to build on this base and make it your own!