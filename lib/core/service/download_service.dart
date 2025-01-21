import 'dart:io';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'video_id_extractor.dart';
import 'file_manager.dart';
import 'stream_downloader.dart';
import 'gallery_saver.dart';

class DownloadService {
  static final YoutubeExplode _youtubeExplode = YoutubeExplode();

  /// Downloads a video from the provided YouTube URL.
  Future<String> downloadVideo(String videoUrl) async {
    try {
      // Extract the video ID from the URL
      final videoId = VideoIdExtractor.extractVideoId(videoUrl);
      if (videoId == null) {
        return "Invalid YouTube video URL";
      }

      // Check if the video is available
      final video = await _youtubeExplode.videos.get(videoId);

      // Get the video manifest
      final manifest = await _youtubeExplode.videos.streamsClient.getManifest(videoId);

      // Try to get the highest quality muxed (video + audio) stream
      StreamInfo? streamInfo;
      final muxedStreams = manifest.muxed;
      if (muxedStreams.isNotEmpty) {
        streamInfo = muxedStreams.withHighestBitrate();
      } else {
        // Fallback to video-only streams if muxed streams are unavailable
        final videoOnlyStreams = manifest.videoOnly;
        if (videoOnlyStreams.isNotEmpty) {
          streamInfo = videoOnlyStreams.withHighestBitrate();
        } else {
          return "No video streams available for this video";
        }
      }

      // Generate a valid file path
      final filePath = await FileManager.getFilePath(video.title, 'mp4');
      if (filePath == null) {
        return "File path not selected";
      }

      // Download the video stream
      await StreamDownloader.downloadStream(streamInfo, filePath);

      // Save to gallery on Android
      if (Platform.isAndroid) {
        await GallerySaver.saveVideoToGallery(filePath);
        return "Downloaded and saved to gallery";
      } else {
        return "Downloaded to $filePath";
      }
    } on YoutubeExplodeException catch (err) {
      return "Invalid YouTube video ID or URL: ${err.message}";
    } catch (err) {
      return "Failed to download video: $err";
    } finally {
       _youtubeExplode.close();
    }
  }

  /// Downloads audio from the provided YouTube URL.
  Future<String> downloadAudio(String videoUrl) async {
    try {
      // Extract the video ID from the URL
      final videoId = VideoIdExtractor.extractVideoId(videoUrl);
      if (videoId == null) {
        return "Invalid YouTube video URL";
      }

      // Check if the video is available
      final video = await _youtubeExplode.videos.get(videoId);

      // Get the video manifest
      final manifest = await _youtubeExplode.videos.streamsClient.getManifest(videoId);

      // Try to get the highest quality audio-only stream
      final audioStreams = manifest.audioOnly;
      if (audioStreams.isEmpty) {
        return "No audio streams available for this video";
      }

      final streamInfo = audioStreams.withHighestBitrate();

      // Generate a valid file path
      final filePath = await FileManager.getAudioFilePath(video.title, 'mp3');
      if (filePath == null) {
        return "File path not selected";
      }

      // Download the audio stream
      await StreamDownloader.downloadStream(streamInfo, filePath);

      return "Audio downloaded and saved to $filePath";
    } on YoutubeExplodeException catch (err) {
      return "Invalid YouTube video ID or URL: ${err.message}";
    } catch (err) {
      return "Failed to download audio: $err";
    } finally {
       _youtubeExplode.close();
    }
  }
}