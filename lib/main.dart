import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const CatfymApp());
}

class CatfymApp extends StatelessWidget {
  const CatfymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CATFYM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryBackground,
        primaryColor: AppColors.accentMagenta,
        fontFamily: 'Arial',

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentMagenta,
            foregroundColor: AppColors.buttonTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),

      // Pantalla inicial
      home: LoginScreen(),
    );
  }
}