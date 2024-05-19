# TP Mobile Synthese : Flutter Application

## Overview

This Flutter application, named "TP Synthese", showcases a variety of functionalities including contact management, weather updates, a chatbot, and mask detection. The main purpose of this app is to demonstrate the integration of different features within a single application.

## Features

1. **Home Page**
    - Displays a welcome message and an avatar image.
    - Encourages users to explore different functionalities of the app.

2. **Contact Page**
    - Allows users to add and delete contacts.
    - Each contact is displayed with an initial avatar.

3. **Weather Page (Meteo)**
    - Provides weather updates (functionality to be implemented).

4. **ChatBot Page**
    - Implements a simple chatbot interface (functionality to be implemented).

5. **Mask Detection Page**
    - Allows users to detect if a person is wearing a mask through the camera.
    - Uses TensorFlow Lite for mask detection.

## Installation

To run this application, you need to have Flutter installed on your machine. Follow the steps below to get started:

1. Clone the repository:
    ```bash
    git clone <repository_url>
    cd tp_synthese_flutter
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the application:
    ```bash
    flutter run
    ```

## Directory Structure

```
tp_synthese_flutter/
│
├── android/                    # Android specific files
├── assets/                     # Image and other asset files
│   ├── myavatar.png
│   └── photo.png
├── ios/                        # iOS specific files
├── lib/                        # Dart source files
│   ├── chatbot.dart            # ChatBot page
│   ├── contactPage.dart        # Contact page
│   ├── main.dart               # Main entry point
│   ├── maskDetection.dart      # Mask detection page
│   └── meteoPage.dart          # Weather page
├── test/                       # Unit tests
├── pubspec.yaml                # Flutter dependencies
└── README.md                   # Project documentation
```

## Dependencies

The project relies on several Flutter and Dart packages:

- `flutter`
- `flutter/material.dart`
- `tflite_flutter`
- `tflite_flutter_helper`
- `image_picker`

## Mask Detection Feature

The mask detection feature uses TensorFlow Lite to identify whether a person is wearing a mask. The model file `mask_detector.tflite` is used for this purpose. The user can take a picture using the camera, and the application will determine if the person in the image is wearing a mask.

## Screenshots

### Home Page
![Home Page](path_to_home_page_screenshot)

### Navigation Drawer
![Navigation Drawer](path_to_navigation_drawer_screenshot)

### Contact Page
![Contact Page](path_to_contact_page_screenshot)

## Future Improvements

- **Weather Page**: Implement API integration for real-time weather updates.
- **ChatBot Page**: Integrate a chatbot API for interactive conversations.
- **Mask Detection**: Improve the mask detection algorithm and performance.

## Conclusion

The TP Synthese application is a versatile Flutter project that demonstrates the integration of various functionalities. It provides a solid foundation for further development and enhancement of features.
