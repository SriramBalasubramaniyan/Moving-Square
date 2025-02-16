# Square Movement Flutter App

## Overview
This is a simple Flutter application where a square moves left or right when tapped on the respective arrow icons. The square starts at the center of the screen and smoothly animates to the left or right edge when the arrows are tapped.

## Features
- The square starts in the center when the app initializes.
- Left and right arrow icons are shown beside the square to move it in respective directions.
- The square smoothly animates to the left or right end of the screen when tapped.
- Once at the edge, the corresponding arrow disappears.
- Uses `AnimatedPositioned` for smooth animations.
- Implements a system-based dark/light theme.

## Screenshots
(Insert relevant screenshots here)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/flutter-square-movement.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter-square-movement
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Code Structure
- `main.dart`: Contains the core logic and UI.
- `SquareMovementScreen`: Stateful widget handling movement logic.
- `_moveSquare()`: Moves the square to the left or right edge.

## Technologies Used
- Flutter
- Dart

## How It Works
- The `AnimatedPositioned` widget smoothly transitions the square when the left or right arrow is tapped.
- `GestureDetector` is used to detect taps on the arrows.
- `_position` variable determines the square’s position dynamically based on screen width.
- `_isAnimating` ensures smooth animations without interruptions.

## Contributing
Feel free to contribute to this project by creating a pull request or reporting issues.

## License
This project is licensed under the MIT License.

