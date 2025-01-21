import 'dart:io';
import 'package:flutter/services.dart';

class GallerySaver {
  static const MethodChannel _channel = MethodChannel('gallery_saver');

  /// Saves a video to the gallery on Android.
  static Future<void> saveVideoToGallery(String filePath) async {
    try {
      if (Platform.isAndroid) {
        await _channel.invokeMethod('saveVideo', {'filePath': filePath});
      }
    } on PlatformException catch (e) {
      print("Failed to save video to gallery: ${e.message}");
    }
  }
}