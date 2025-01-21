import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_fetch/core/router/app_router.dart';
import 'package:vid_fetch/core/utils/constants/routes.dart';
import 'package:vid_fetch/core/utils/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        builder: (context, widget) {
          final mediaQueryData = MediaQuery.of(context);
          final scaledMediaQueryData = mediaQueryData.copyWith(
            textScaler: TextScaler.noScaling,
          );
          return MediaQuery(
            data: scaledMediaQueryData,
            child: widget!,
          );
        },
        title: 'Vid Fetch',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.initialRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
