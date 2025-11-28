import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constanse/app_colors.dart';

abstract final class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Baloo Thambi 2",
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.yellow[0],
      onPrimary: AppColors.black,
      secondary: AppColors.darkGray[40],
      onSecondary: AppColors.white,
      shadow: AppColors.darkGray[10],
      onSurface: AppColors.green[0],
      error: AppColors.red[0],
      onSurfaceVariant: AppColors.darkGray[90],
      seedColor: AppColors.yellow,
      outline: AppColors.darkGray[20],
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 44.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.yellow[0],
      ),
      displayMedium: TextStyle(
        fontSize: 33.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.darkGray[10],
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.darkGray[20],
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.yellow[0],
      selectionHandleColor: AppColors.yellow[0],
      selectionColor: AppColors.yellow[0]?.withValues(alpha: 0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow[0],
        foregroundColor: AppColors.black,
        disabledBackgroundColor: AppColors.darkGray[20],
        disabledForegroundColor: AppColors.white ,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}
