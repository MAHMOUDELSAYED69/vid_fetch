package com.example.vid_fetch

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.media.MediaScannerConnection
import java.io.File

class MainActivity : FlutterActivity() {
    private val channel = "gallery_saver"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveVideo" -> {
                    val filePath = call.argument<String>("filePath")
                    if (filePath != null) {
                        saveVideoToGallery(filePath, result)
                    } else {
                        result.error("INVALID_PATH", "File path is null", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun saveVideoToGallery(filePath: String, result: MethodChannel.Result) {
        val file = File(filePath)
        if (file.exists()) {
            MediaScannerConnection.scanFile(this, arrayOf(filePath), null) { _, uri ->
                if (uri != null) {
                    result.success("Video saved to gallery")
                } else {
                    result.error("SAVE_FAILED", "Failed to save video to gallery", null)
                }
            }
        } else {
            result.error("FILE_NOT_FOUND", "File does not exist", null)
        }
    }
}