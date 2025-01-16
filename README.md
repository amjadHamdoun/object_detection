This app uses the device's camera to detect a target object in real-time.
It provides user guidance, captures an image when the object is correctly positioned, 
and displays the captured image with metadata such as object type, confidence score,
and timestamp.

## Features
- Real-time object detection using the device camera.
- Guidance to the user with messages like "Move closer", "Move farther", or "Object in position".
- Auto-capture of the image once the object is in the correct position.
- Display of captured image with metadata (type of object, confidence score, date, timestamp).

## Prerequisites

- Flutter SDK (2.x or later).
- A physical device or an emulator with camera support.
- Android or iOS development environment set up (Android Studio/Xcode).


##Challenges and Solutions

#Challenge 1: Object Detection in Real-Time
Problem: Detecting the object in real-time with high accuracy.
Solution: We used a pre-trained TensorFlow Lite or other machine learning models for real-time object detection. This allows the app to efficiently classify objects from camera frames in near real-time.

#Challenge 2: Auto-Capturing Images
Problem: Automatically capturing an image once the object is in position without user intervention.
Solution: We used the confidence score from the object detection model. Once the confidence for the detected object was above a threshold (0.7), we automatically triggered the camera to capture the image.

#Challenge 3: Providing User Guidance
Problem: Giving accurate, helpful guidance to the user to position the object correctly.
Solution: Based on the detection confidence, we provided dynamic messages like "Move closer" or "Object in position". We also used visual cues like bounding boxes to indicate where the object is located on the screen.

#Challenge 4: Handling Different Screen Orientations
Problem: Ensuring the app works smoothly in both portrait and landscape orientations.
Solution: The camera preview and UI elements were adjusted dynamically based on the screen's aspect ratio to ensure proper scaling and positioning across different orientations.
