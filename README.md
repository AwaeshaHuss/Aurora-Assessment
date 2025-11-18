<!--- README for Palette Image App -->

# 🌈 Palette Image App — Random Image + Adaptive Background

![Flutter Badge](https://img.shields.io/badge/Flutter-2.10-blue?logo=flutter)
![Dart Badge](https://img.shields.io/badge/Dart-2.18-blue?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

✨ A tiny Flutter app that fetches a random image from an API and displays it centered as a square. The app adapts the screen background to the image's dominant color for an immersive look. Tap **Another** to fetch a new image.

Demo (replace with your recording):

![demo-placeholder](https://via.placeholder.com/800x420.png?text=Record+your+demo+and+replace+this+image)

--

**Highlights**

- Single-screen UI with a centered square image
- Background color adapts smoothly to the image palette
- Fast image loading with caching and placeholders
- Smooth transitions and fade-in animation
- Tapping image or `Another` button fetches a new image
- Clean architecture (domain / data / presentation)
- Bloc state management and accessible controls
- CI: `flutter analyze` GitHub Action included

--

**Table of Contents**

- [Quick Start](#quick-start)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [State Management](#state-management)
- [Scripts & Helpers](#scripts--helpers)
- [Running on a Physical Device (Wi‑Fi)](#running-on-a-physical-device-wi-fi)
- [Recording a Demo Video](#recording-a-demo-video)
- [CI / Linting](#ci--linting)
- [Troubleshooting](#troubleshooting)
- [Submission Checklist](#submission-checklist)
- [License](#license)

--

**Important — API endpoint**

This app calls:

```
GET https://november7-730026606190.europe-west1.run.app/image/

Response example: {"url": "https://images.unsplash.com/..."}
```

The server enables CORS — the app treats returned Unsplash URLs as large remote images and uses cache/placeholder strategies.

--

## Quick Start

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Open terminal and run:

```bash
cd /Users/husseinawaisheh/Desktop/mac/apps/learn/assesment/flutter_app
flutter pub get
flutter run
```

If you want to run on a specific device:

```bash
flutter devices           # list devices
flutter run -d <device-id>
```

--

## Architecture

This app follows a small Clean Architecture layout:

- domain/: Entities and use-cases (pure business logic)
- data/: Data sources and repository implementations
- presentation/: UI, widgets, and Bloc state management

Flow: UI (Bloc) -> Usecase -> Repository -> RemoteDataSource (HTTP) -> JSON

--

## Project Structure

Key files and folders (top-level `flutter_app/`):

```
lib/
	domain/
		entities/random_image.dart
		repositories/image_repository.dart
		usecases/get_random_image.dart
	data/
		datasources/remote_image_datasource.dart
		repositories/image_repository_impl.dart
	presentation/
		bloc/                # ImageBloc, event, state
		pages/home_page.dart
		widgets/             # ImageSquare, AnotherButton
	main.dart
pubspec.yaml
scripts/
	create_platforms.sh   # helper to run `flutter create .`
	publish.sh            # helper to push to GitHub
.github/workflows/
	flutter_analyze.yml
```

--

## State Management

- Uses `flutter_bloc` for predictable state and separation of concerns.
- `ImageBloc` handles fetching the image URL and computing a palette (dominant color). Palette computation runs asynchronously so the UI shows the image immediately.

--

## Scripts & Helpers

- `./scripts/create_platforms.sh` — runs `flutter create .` to generate `android/` and `ios/` folders (run locally).
- `./scripts/publish.sh <repo-url>` — initialize git, commit, and push to your GitHub repo.

Usage example to publish (replace with your repo):

```bash
cd flutter_app
chmod +x ./scripts/publish.sh
./scripts/publish.sh https://github.com/AwaeshaHuss/Aurora-Assessment.git
```

--

## Running on a Physical Device (Wi‑Fi)

Follow these steps (USB-first recommended):

1. Enable Developer Options on your Android device and enable `USB debugging`.
2. Connect with USB and run:

```bash
adb devices
adb tcpip 5555
```
3. Get device IP from Wi‑Fi settings (e.g., `192.168.1.42`) and run:

```bash
adb connect 192.168.1.42:5555
flutter run -d 192.168.1.42:5555
```

If your device supports Wireless Debugging (Android 11+), use the Wireless Debugging pairing flow.

--

## Recording a Demo Video (suggested)

On macOS (QuickTime):

1. Open QuickTime → File → New Screen Recording
2. Select the simulator or device window
3. Record these actions:
	 - App cold start
	 - Initial image load
	 - Tap `Another` multiple times to show transitions
4. Save file and upload to the repo (small clips) or host externally (YouTube / Drive) and add link to README.

Add the video link in this README under the demo placeholder.

--

## CI / Linting

A basic GitHub Action `flutter_analyze.yml` runs `flutter pub get` and `flutter analyze` on pushes and PRs to `main`.

--

## Troubleshooting

- `adb` not found: ensure Android SDK platform-tools are installed and `adb` is on your PATH.
- NDK mismatch: edit `android/app/build.gradle.kts` and set `ndkVersion = "27.0.12077973"` (already applied in this project).
- HTTP or image fetch issues: test API locally:

```bash
curl https://november7-730026606190.europe-west1.run.app/image/
```

If API returns a JSON with a `url` property the app should load it.

--

## Submission Checklist

1. Generate platform folders (if not present):

```bash
./scripts/create_platforms.sh
flutter pub get
```

2. Run app locally and verify behavior.
3. Record demo video and add link or file to repo.
4. Push code to public GitHub repo and provide the repo URL.

--

## Contributing

If you want me to help further, I can:

- Add unit tests for the bloc,
- Add more polished UI (shadows, blur placeholders),
- Configure release builds and Android signing instructions.

Tell me what you'd like next and I will implement it.

--

## License

MIT — see `LICENSE` (add if needed).

--

Made with ❤️ — tweak the demo image and add your recording to make this README shine.

Generating `android` and `ios` folders

If your copy of this repo doesn't yet have `android/` and `ios/` folders (they're Git-ignored or not generated), run the helper script below to create them using the Flutter SDK installed on your machine:

```bash
cd /Users/husseinawaisheh/Desktop/mac/apps/learn/assesment/flutter_app
./scripts/create_platforms.sh
# or directly
flutter create .
```

Notes:
- The `flutter create .` command will generate platform-specific folders and native boilerplate files. It will not overwrite existing platform files.
- You must have the Flutter SDK installed and available on your `PATH` for the script to work.

Verifying and running on simulator/device

After generating platform folders, run:

```bash
flutter pub get
flutter run
```

If you encounter Android/iOS SDK or signing issues, open the project in Android Studio or Xcode to configure the platform-specific settings.

Preparing for submission (recommended steps)

1. Generate platform folders (if not present):

```bash
cd /Users/husseinawaisheh/Desktop/mac/apps/learn/assesment/flutter_app
./scripts/create_platforms.sh
flutter pub get
```

2. Test locally on a simulator or device:

```bash
flutter run
```

3. Record a short video demonstrating:
- App launch
- Initial image loading
- Tapping `Another` to fetch a new image (show at least 2-3 images)
- Error state (optional)

Use QuickTime on macOS: File → New Screen Recording. Save as `.mov` and optionally compress.

4. Add the video to the repository (if small) or upload it to YouTube/Drive and add the link to this README.

5. Create a public GitHub repository and push the code:

```bash
git init
git add .
git commit -m "Initial commit: palette image app"
git branch -M main
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

6. Add the video link to this README (edit and commit):

```markdown
Video: https://youtu.be/your_video_id_or_drive_link
```

CI (optional)

I included a small GitHub Actions workflow (`.github/workflows/flutter_analyze.yml`) that runs `flutter analyze` on push and pull requests. It helps catch obvious issues before submission.

If you want, I can also prepare a `git` script to set the remote and push the repo for you (you'll still need to run it locally to provide your GitHub credentials).
