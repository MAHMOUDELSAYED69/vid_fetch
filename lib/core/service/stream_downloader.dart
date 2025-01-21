import 'dart:io';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class StreamDownloader {
  static final YoutubeExplode _youtubeExplode = YoutubeExplode();

  /// Downloads a video/audio stream to the specified file path.
  static Future<void> downloadStream(StreamInfo streamInfo, String filePath) async {
    final file = File(filePath);
    final fileStream = file.openWrite();
    try {
      final mediaStream = _youtubeExplode.videos.streamsClient.get(streamInfo);
      await mediaStream.pipe(fileStream);
    } catch (e) {
      print("Error during download: $e");
      rethrow;
    } finally {
      await fileStream.flush();
      await fileStream.close();
    }
  }
}