# VidFetch v1.0.0
VidFetch is a robust and versatile Flutter application that allows you to download YouTube videos and audios effortlessly. Using Riverpod for state management, it’s fully compatible with both Android and Windows platforms, ensuring a seamless experience on mobile and desktop devices.

## Features
- **` Download YouTube Videos`**: Save YouTube videos directly to your device.
- **` Download YouTube Audio`**: Extract and download audio files from YouTube videos.
- **` Cross-Platform`**: Works on both Android and Windows.
- **` Save to Gallery`**: On Android, downloads are automatically saved to your gallery.
- **` Custom Save Path`**: On Windows, choose where to save your downloaded files.
- **` State Management`**: Utilizes Riverpod for efficient and scalable state management.

## Screenshots
<div style="display: flex; justify-content: space-between;">
  
  <img src="https://github.com/user-attachments/assets/adee1f93-2f51-483a-84b8-32b9e57f0370" alt="Screenshot 1" style="width: 24%;"/>
  <img src="https://github.com/user-attachments/assets/f6bbfcb0-3509-4cba-bf12-91ab453231c6" alt="Screenshot 2" style="width: 24%;"/>
  <img src="https://github.com/user-attachments/assets/a2e11c0d-4ca1-4830-a7b4-01b8ce5b3227" alt="Screenshot 3" style="width: 24%;"/>
  <img src="https://github.com/user-attachments/assets/e61aa234-58f1-4af3-a2a4-371f5fba8652" alt="Screenshot 4" style="width: 24%;"/>
  <img src="https://github.com/user-attachments/assets/62335df9-f2e1-4963-8c2b-d121d5ff39a3" alt="Screenshot 6" style="width: 24%;"/>
  <img src="https://github.com/user-attachments/assets/1dbc79a7-811a-4f7f-b816-d7f52c6bc41a" alt="Screenshot 7" style="width: 36%;"/>
  <img src="https://github.com/user-attachments/assets/3e6d8886-d77f-4142-a44b-709f49dea628" alt="Screenshot 8" style="width: 36%;"/>
  <img src="https://github.com/user-attachments/assets/114ba653-fa69-4d5a-9315-ced41461b38c" alt="Screenshot 9" style="width: 32%;"/>
  <img src="https://github.com/user-attachments/assets/fbf5b7b2-9d53-4ebd-9b43-92a37ba847a2" alt="Screenshot 10" style="width: 32%;"/>
  <img src="https://github.com/user-attachments/assets/1deb3ec2-fb53-4edd-9ca7-b8015ac17096" alt="Screenshot 11" style="width: 32%;"/>
</div>


## Getting Started
To get started with VidFetch, follow these steps:

- **`Step 1:`** Clone the Repository
First, you'll need to clone the repository from GitHub. Open your terminal and run the following command:
```
https://github.com/MAHMOUDELSAYED7/VidFetch.git
```
Replace <repository-url> with the actual URL of your repository if it was changed.

- **`Step 2:`** Install Dependencies
After navigating to the project directory, you need to install all the necessary dependencies. Run:
```
flutter pub get
```
This command fetches all the dependencies listed in the `pubspec.yaml` file.

- **`Step 3:`** Configure the App
Ensure all necessary configurations are done. This includes adding your assets and setting up environment variables if needed. Verify that your `pubspec.yaml` file includes all required `assets` and `fonts`.

- **`Step 4:`** Run the Application
Finally, run the application on your desired device using the following command:
`
```
flutter run
```
This command compiles your Flutter app and deploys it to the connected device or simulator.

Additional Tips
**`Updating Dependencies:`** If there are any updates to the dependencies, you can update them using:
```
flutter pub upgrade --major-versions
```
Flutter Doctor: Run flutter doctor to ensure that your development environment is set up correctly.
```
flutter doctor
```
This command checks your environment and displays a report of the status of your Flutter installation, dependencies, and connected devices.

By following these steps, you'll have the VidFetch app and running on your device. If you encounter any issues during installation, please refer to the Flutter documentation.

## Dependencies

VidFetch relies on the following Flutter packages:

- **`device_info_plus`**: Retrieves device information.
- **`file_picker`**: Allows users to pick files from the device.
- **`flutter`**: The framework for building the app.
- **`flutter_riverpod`**: State management solution.
- **`flutter_screenutil`**: Responsive screen handling.
- **`image_gallery_saver`**: Saves images or videos to the gallery.
- **`loading_indicator`**: A widget for displaying various loading indicators.
- **`path_provider`**: Provides access to commonly used locations on the filesystem.
- **`permission_handler`**: Manages app permissions.
- **`window_manager`**: Handles window management on desktop platforms.
- **`youtube_explode_dart`**: A library for extracting YouTube media.
#### Dev Dependencies
- **`flutter_launcher_icons`**: A package to automatically generate app icons.
- **`flutter_lints`**: A collection of lints to improve the quality of your code.
- **`flutter_test`**: A testing framework for Flutter.


## Usgae
1. **`Install the App`**
- Clone the repository and run flutter pub get to install dependencies.
- For Android, run flutter run on your device or emulator.
- For Windows, run flutter run -d windows on your PC.

2. **`Open the App`**
- Launch VidFetch on your device or desktop.

3. **`Select a YouTube Video`**
- Use the app interface to search for and select a YouTube video.
4. **`Choose Download Option`**

- Choose whether to download the video or extract the audio.
5. **`Save the File`**

- On Android, the file will automatically be saved to your gallery.
- On Windows, you'll be prompted to select a save location for the file.

6. **`View Downloaded Files`**
- Access your downloaded videos or audios from the gallery on Android or from the specified path on Windows.

#### Enjoy using VidFetch to easily download and manage YouTube videos and audios on Android and Windows!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please reach out via email: [mahmoudelsayed.dev@gmail.com](mahmoudelsayed.dev@gmail.com)
