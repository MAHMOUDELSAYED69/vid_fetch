import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';

Future<void> main() async {
  if (Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(450, 600),
      center: true,
      backgroundColor: Colors.transparent,
      title: 'VidFetch',
      titleBarStyle: TitleBarStyle.normal,
      skipTaskbar: false,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setResizable(false);
      await windowManager.setMinimumSize(const Size(450, 600));
      await windowManager.setMaximizable(false);
    });
  }

  runApp(const ProviderScope(child: MyApp()));
}
  