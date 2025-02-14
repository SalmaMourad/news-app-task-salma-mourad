import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      // dividerColor: AppColors.purple,
      primaryColor: AppColors.black,//,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        centerTitle: true,
        elevation: 0,
      ),
      textTheme: const TextTheme(

        bodyLarge: TextStyle(
            color: AppColors.white, fontSize: 25, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            color: AppColors.black, fontSize: 22, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            color: AppColors.grey, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      // dividerTheme: const DividerThemeData(
      //   color: AppColors.purple,
      // ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.black,
              textStyle: const TextStyle(
                  color: AppColors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColors.grey,
          suffixIconColor: AppColors.grey,
          hintStyle: const TextStyle(
              fontSize: 16, color: AppColors.grey, fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
   
          ));








  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.white,//,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
      ),
      textTheme: const TextTheme(

        bodyLarge: TextStyle(
            color: AppColors.black, fontSize: 25, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            color: AppColors.grey, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.white,
              textStyle: const TextStyle(
                  color: AppColors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColors.grey,
          suffixIconColor: AppColors.grey,
          hintStyle: const TextStyle(
              fontSize: 16, color: AppColors.grey, fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
        
          ));



}
