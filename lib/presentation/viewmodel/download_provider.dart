import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/service/download_service.dart';

final downloadStateProvider =
    StateNotifierProvider<DownloadStateNotifier, DownloadState>(
  (ref) => DownloadStateNotifier(),
);

class DownloadState {
  final bool isVideoDownloading;
  final bool isAudioDownloading;
  final bool isDownloadDone;
  final String? message;

  DownloadState({
    this.isVideoDownloading = false,
    this.isAudioDownloading = false,
    this.isDownloadDone = false,
    this.message,
  });

  DownloadState copyWith({
    bool? isVideoDownloading,
    bool? isAudioDownloading,
    bool? isDownloadDone,
    String? message,
  }) {
    return DownloadState(
      isVideoDownloading: isVideoDownloading ?? this.isVideoDownloading,
      isAudioDownloading: isAudioDownloading ?? this.isAudioDownloading,
      isDownloadDone: isDownloadDone ?? this.isDownloadDone,
      message: message ?? this.message,
    );
  }
}

class DownloadStateNotifier extends StateNotifier<DownloadState> {
  DownloadStateNotifier() : super(DownloadState());

  Future<void> downloadVideo(String url) async {
    state = state.copyWith(
        isVideoDownloading: true, message: "Downloading Video File...");
    final result = await DownloadService().downloadVideo(url);
    state = state.copyWith(isDownloadDone: true, message: result);
    state = state.copyWith(isVideoDownloading: false);
    await Future.delayed(
      const Duration(seconds: 3),
      () => state = state.copyWith(isDownloadDone: false),
    );
  }

  Future<void> downloadAudio(String url) async {
    state = state.copyWith(
        isAudioDownloading: true, message: "Downloading Audio File...");
    final result = await DownloadService().downloadAudio(url);
    state = state.copyWith(isDownloadDone: true, message: result);
    state = state.copyWith(isAudioDownloading: false);
    await Future.delayed(
      const Duration(seconds: 3),
      () => state = state.copyWith(isDownloadDone: false),
    );
  }
}
