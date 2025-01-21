import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class FileManager {
  /// Generates a valid file path for saving videos.
  static Future<String?> getFilePath(String title, String extension) async {
    final cleanedTitle = _cleanFileName(title);

    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      final videoDir = Directory('${directory?.path}/Movies');
      if (!await videoDir.exists()) {
        await videoDir.create(recursive: true);
      }
      return '${videoDir.path}/Vid_Fetch_$cleanedTitle.$extension';
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Video File',
        fileName: 'Vid_Fetch_$cleanedTitle.$extension',
      );
      return result;
    } else {
      throw UnsupportedError('This platform is not supported');
    }
  }

  /// Generates a valid file path for saving audio.
  static Future<String?> getAudioFilePath(String title, String extension) async {
    final cleanedTitle = _cleanFileName(title);

    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      final musicDir = Directory('${directory?.path}/Music');
      if (!await musicDir.exists()) {
        await musicDir.create(recursive: true);
      }
      return '${musicDir.path}/Vid_Fetch_$cleanedTitle.$extension';
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Audio File',
        fileName: 'Vid_Fetch_$cleanedTitle.$extension',
      );
      return result;
    } else {
      throw UnsupportedError('This platform is not supported');
    }
  }

  /// Cleans a string to make it a valid filename by removing invalid characters.
  static String _cleanFileName(String title) {
    return title.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').replaceAll(RegExp(r'\s+'), '_');
  }
}