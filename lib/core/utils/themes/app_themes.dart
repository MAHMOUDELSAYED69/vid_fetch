import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_fetch/core/utils/constants/fonts.dart';

import '../constants/colors.dart';

abstract class AppTheme {
  //!! LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.darkGrey,
        selectionColor: ColorManager.darkGrey.withOpacity(0.3),
        selectionHandleColor: ColorManager.darkGrey,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(ColorManager.red.withOpacity(0.1)),
          foregroundColor: const WidgetStatePropertyAll(ColorManager.red),
          side: WidgetStatePropertyAll(
            BorderSide(
              width: 3,
              color: ColorManager.red.withOpacity(0.3),
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(95.w, 50.h),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          elevation: const WidgetStatePropertyAll(5),
          backgroundColor: const WidgetStatePropertyAll(ColorManager.lightGrey),
          overlayColor:
              WidgetStatePropertyAll(ColorManager.white.withOpacity(0.2)),
          foregroundColor: const WidgetStatePropertyAll(ColorManager.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(double.maxFinite, 40.h),
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: const WidgetStatePropertyAll(ColorManager.white),
        fillColor: const WidgetStatePropertyAll(ColorManager.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        side: const BorderSide(color: ColorManager.red, width: 1),
      ),
      //

      iconTheme: const IconThemeData(color: ColorManager.darkGrey),
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(ColorManager.red),
        thumbColor: WidgetStatePropertyAll(ColorManager.white),
        trackColor: WidgetStatePropertyAll(ColorManager.red),
        thumbIcon: WidgetStatePropertyAll(Icon(
          Icons.light_mode,
          color: ColorManager.white,
        )),
      ),
      fontFamily: FontFamilyManager.roboto,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.white,
      //-----------------------------------------------------------//* APP BAR
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: ColorManager.darkGrey,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyManager.roboto,
        ),
        backgroundColor: ColorManager.white,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: ColorManager.red),
        elevation: 0,
        shadowColor: ColorManager.transparent,
      ),

      //-----------------------------------------------------------//* TEXT
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 20.sp,
          color: ColorManager.darkGrey,
        ),
        bodyMedium: TextStyle(
          fontSize: 15.sp,
          color: ColorManager.darkGrey,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          color: ColorManager.darkGrey,
        ),

        displayLarge: TextStyle(
          fontSize: 20.sp,
          color: ColorManager.red,
        ),
        //--------------------------------------------------//* For button
        displayMedium: TextStyle(
          fontSize: 15.sp,
          color: ColorManager.red,
        ),
        displaySmall: TextStyle(
          color: ColorManager.red,
          fontSize: 12.sp,
        ),
      ),
      //--------------------------------------------------//* INPUT DECORATION
      inputDecorationTheme: InputDecorationTheme(
        isCollapsed: true,
        isDense: true,
        errorStyle:
            TextStyle(fontSize: 12.sp, color: ColorManager.red, height: 0.5),
        hintStyle: TextStyle(fontSize: 12.sp, color: ColorManager.grey),
        fillColor: ColorManager.white,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.4,
            color: ColorManager.darkGrey,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.4,
            color: ColorManager.darkGrey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.4,
            color: ColorManager.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.4,
            color: ColorManager.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10),
      ),
    );
  }
}
