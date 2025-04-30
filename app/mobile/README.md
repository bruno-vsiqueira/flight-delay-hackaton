# Flight Delay Predictor - Mobile App

This is the mobile application for the Flight Delay Predictor project. The app allows users to select a day of the week and an airport to predict the chances of flight delays.

## Features

- Select a day of the week and an airport.
- Predict flight delay chances and confidence percentage.
- User-friendly interface with modern design.

## Prerequisites

Before running the app, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.6.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- A device or emulator to run the app (iOS, Android, or Web)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-repo/flight-delay-hackaton.git
   cd flight-delay-hackaton/app/mobile
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

## Running the App

### On Android:

1. Connect an Android device or start an emulator.
2. Run the app:

   ```bash
   flutter run
   ```

### On iOS:

1. Connect an iOS device or start a simulator.
2. Run the app:

   ```bash
   flutter run
   ```

   > **Note:** Ensure you have Xcode installed and set up for iOS development.

### On Web:

1. Ensure you have a supported browser installed (e.g., Chrome).
2. Run the app:

   ```bash
   flutter run -d chrome
   ```

## Building for Production

### Android:

1. Build the APK:

   ```bash
   flutter build apk
   ```

2. The APK will be located in the `build/app/outputs/flutter-apk/` directory.

### iOS:

1. Build the app:

   ```bash
   flutter build ios
   ```

2. Open the project in Xcode to archive and distribute.

### Web:

1. Build the web app:

   ```bash
   flutter build web
   ```

2. The web build will be located in the `build/web/` directory.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](../../LICENSE) file for details.
