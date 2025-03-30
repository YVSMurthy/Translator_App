# Translator App using Flutter

## Preview

<div style="display: flex; justify-content: center; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/4b89e61c-ce98-4935-bd70-2930964b3839" width="250" alt="Home Screen"/>
  <img src="https://github.com/user-attachments/assets/5502bcd5-f762-4f6e-a01a-825b8685ded1" width="250" alt="Text to Text Translation"/>
  <img src="https://github.com/user-attachments/assets/601471f1-4c15-4c42-a848-dbbc99a3be36" width="250" alt="Speech to Speech Translation"/>
</div>

## Overview

The Flutter Translator App is a versatile and user-friendly translation tool that supports both text-to-text and voice-to-voice translations. With its seamless design and powerful features, it bridges the gap between languages, providing instant and accurate translations for users. Built using Flutter and leveraging the translator library, the app ensures smooth functionality and a delightful user experience.

## Features

### 1. Text to Text Translation
- Users can type text in the input box
- The typed text is translated into the selected target language
- Translated text is displayed in the output box

### 2. Speech to Speech Translation
- Users can click the microphone icon to start speech recognition
- Recognized speech is displayed in the input text box in real-time
- Clicking the microphone again stops the recognition and triggers translation
- Translated text is displayed in the output box and narrated aloud
- A play button allows users to replay the narrated translation

## Technologies Used
- **Flutter:** Cross-platform framework for building the app
- **Translator Library:** For handling translations
- **Speech-to-Text and Text-to-Speech libraries:** For voice input and output functionality

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Dart SDK
- Android Studio / VS Code
- Android or iOS device/emulator

### Installation

1. Clone the repository
```shell
git clone https://github.com/yourusername/flutter-translator.git
cd flutter-translator
```

2. Install dependencies
```shell
flutter pub get
```

3. Run the app
```shell
flutter run
```

## Project Structure

```
flutter_translator/
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── lib/                        # Dart source code
│   ├── main.dart               # Entry point of the application
│   ├── screens/                # UI screens
│   │   ├── home_screen.dart    # Main screen
│   │   ├── t2t_screen.dart     # Text to Text translation screen
│   │   └── s2s_screen.dart     # Speech to Speech translation screen
│   ├── services/               # Service classes
│   │   ├── translator.dart     # Translation service
│   │   ├── speech_to_text.dart # Voice recognition service
│   │   └── text_to_speech.dart # Text to voice service
│   └── widgets/                # Reusable UI components
├── assets/                     # Assets like images, fonts
│   └── screenshots/            # App screenshots
│       ├── home.png
│       ├── t2t.png
│       └── s2s.png
└── pubspec.yaml                # Project dependencies
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  translator: ^0.1.7
  speech_to_text: ^6.1.1
  flutter_tts: ^3.6.3
  shared_preferences: ^2.1.0
  provider: ^6.0.5
  cupertino_icons: ^1.0.2
```