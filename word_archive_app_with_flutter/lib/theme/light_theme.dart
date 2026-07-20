// app_light_theme.dart
import 'package:flutter/material.dart';
import 'package:word_archive_app_with_flutter/theme/colors.dart';

class AppLightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,

      // 🎨 Ana renkler
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
        surface: Colors.white,
        onSurface: Colors.black,
      ),

      // 🧱 Scaffold
      scaffoldBackgroundColor: Colors.white,

      // 📝 Text
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.blue.shade600,
        contentTextStyle: TextStyle(color: Colors.white),
      ),

      // 🔘 AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.darkIcon),
      ),

      tabBarTheme: TabBarThemeData(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.white,
      ),

      // 🔘 Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
