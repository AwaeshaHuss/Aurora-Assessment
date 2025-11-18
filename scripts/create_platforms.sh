#!/usr/bin/env bash
set -euo pipefail

# Helper script to generate Android and iOS platform folders for the Flutter app.
# Run this from macOS/Linux where Flutter SDK is installed.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "Running 'flutter create .' in $ROOT_DIR to generate platform folders..."
cd "$ROOT_DIR"

# Create platform folders and required files. This will not overwrite existing files.
flutter create --platforms=android,ios .

# pub get then run the app on the connected emulator/simulator or physical device.
flutter pub get
flutter run

echo "Platform folders generated. You can now open the project in your IDE or run 'flutter run'."