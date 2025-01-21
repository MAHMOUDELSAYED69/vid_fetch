import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_fetch/core/utils/constants/images.dart';
import 'package:vid_fetch/core/utils/constants/routes.dart';
import 'package:vid_fetch/core/utils/extension/extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
          context, RouteManager.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              ImageManager.logo,
              width: 100.w,
            ),
            Text("Vid Fetch", style: context.textTheme.bodyMedium),
            const Spacer(),
            Text("Version 1.0.0", style: context.textTheme.displaySmall),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
