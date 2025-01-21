class VideoIdExtractor {
  /// Extracts the video ID from a YouTube URL.
  static String? extractVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    // Handle regular YouTube URLs (e.g., https://www.youtube.com/watch?v=VIDEO_ID)
    if (uri.host.contains('youtube.com')) {
      if (uri.pathSegments.contains('shorts')) {
        // Handle YouTube Shorts URLs (e.g., https://www.youtube.com/shorts/VIDEO_ID)
        return uri.pathSegments.last;
      } else {
        // Handle regular YouTube URLs
        return uri.queryParameters['v'];
      }
    }

    // Handle youtu.be URLs (e.g., https://youtu.be/VIDEO_ID)
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.first;
    }

    return null;
  }
}