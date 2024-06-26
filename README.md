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
    git clone https://github.com/NouhaylaMouakkal/TP-synthese-Flutter
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
<img src="images/homePage.jpg" alt="Home Page" width="300"/>

### Navigation Drawer
<img src="images/Menu.jpg" alt="Navigation Drawer" width="300"/>

### Contact Page
<img src="images/Contact.jpg" alt="Contact Page" width="300"/>

### Weather Page
<img src="images/weatherTest1.jpg" alt="Weather Page" width="300"/>
<img src="images/weatherTest2.jpg" alt="Weather Page" width="300"/>

### Chatbot Page
<img src="images/Chatbot.jpg" alt="Chatbot Page" width="300"/>

### Mask Detection Page
<img src="images/maskDetection.jpg" alt="Mask Detection Page" width="300"/>


## Conclusion

The TP Synthese application is a versatile Flutter project that demonstrates the integration of various functionalities. It provides a solid foundation for further development and enhancement of features.
