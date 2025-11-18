# Palette Image App

This is a tiny Flutter app that fetches a random image from the provided API and displays it as a centered square. The background adapts to the image's dominant colors. Tap the **Another** button to fetch a new image.

Features
- Single screen UI
- Square image centered on screen
- Background color adapts to image using `palette_generator`
- `Another` button to fetch a new image
- Loading and error states
- Smooth transitions and fade-ins
- Respects light/dark mode and basic accessibility

Run (macOS / Linux / Windows)

1. Ensure Flutter is installed: https://flutter.dev/docs/get-started/install
2. From this folder run:

```bash
cd flutter_app
flutter pub get
flutter run
```

API

This app fetches images from:

`https://november7-730026606190.europe-west1.run.app/image/`

Submission steps (guide)

1. Create a public GitHub repository. Example commands:

```bash
cd flutter_app
git init
git add .
git commit -m "Initial commit: palette image app"
git branch -M main
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

2. Record a short video showing the app starting, loading images, and tapping `Another`. On macOS you can use QuickTime:

 - Open QuickTime Player → File → New Screen Recording
 - Select record area or full screen and record while interacting with the app (simulator or device)
 - Save the .mov and optionally compress it

3. Upload the video to the repository: either add the file to the repo (for small clips) or upload to a hosting service (YouTube, Google Drive) and place the link in the README.md.

4. Share the repository URL and (if uploaded externally) the video link.

If you'd like, I can:
- prepare a `git` commit here and show exact commands to run locally, or
- create a minimal GitHub Actions workflow to run `flutter analyze`.

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
