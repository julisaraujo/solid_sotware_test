# solid_sotware_test

Solid software test

## About the App

This application is a Flutter-based project designed to demonstrate various color modes and gradients. Users can explore different visual effects, including solid colors, linear gradients, radial gradients, and sweep gradients. The app serves as a practical example of state management and UI design in Flutter.

## Getting Started

This project is a starting point for a Flutter application. To use this project, you need to have **Flutter 3.27.3** installed. You can download Flutter from the [official website](https://flutter.dev/).

### Requirements

To run this project, ensure you have the following installed:

- **Flutter 3.27.3**: [Download Flutter](https://flutter.dev/)
- **Dart SDK**: Comes bundled with Flutter.
- **Android Studio** or **Visual Studio Code**: For development and debugging.
- **Android Emulator** or **Physical Device**: To run the application.
- **Xcode** (macOS only): For iOS development.

### How to Run

Follow these steps to run the project:

1. Clone the repository:
    ```bash
    git clone https://github.com/julisaraujo/solid_sotware_test.git
    cd solid_sotware_test
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the application:
    - For Android:
      ```bash
      flutter run
      ```
    - For iOS (macOS only):
      ```bash
      flutter run -d ios
      ```

4. To specify a particular device, use:
    ```bash
    flutter devices
    flutter run -d <device_id>
    ```

### Project Structure

The project is organized into the following directories:

#### `lib/`
The main source folder for the Flutter application.

#### `lib/core/`
Contains core utilities and shared resources used across the application.

- **`utils/`**: Utility classes and functions.
     - **`constants/`**: Stores constant values such as `font_family.dart`.
     - **`enums/`**: Defines enumerations like `color_mode.dart`.
     - **`extensions/`**: Contains extensions, such as `color_mode_extension.dart`.
     - **`color_utils.dart`**: Provides color-related utility functions.

#### `lib/providers/`
Holds state management logic for the application.

- **`modes/`**: Includes notifiers for different color modes:
     - `linear_gradient_notifier.dart`
     - `radial_gradient_notifier.dart`
     - `solid_color_notifier.dart`
     - `sweep_gradient_notifier.dart`
- **`color_mode_notifier.dart`**: Manages the overall color mode state.

#### `lib/views/`
Contains the UI components of the application.

- **`home/`**: Includes the main screen, such as `home_screen.dart`.
- **`modes/`**: Screens for different color modes:
     - `linear_gradient_screen.dart`
     - `radial_gradient_screen.dart`
     - `solid_screen.dart`
     - `sweep_gradient_screen.dart`

#### `lib/main.dart`
The entry point of the Flutter application.

### Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
