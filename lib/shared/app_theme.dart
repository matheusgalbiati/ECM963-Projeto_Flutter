import 'package:flutter/material.dart';
import 'package:imdb/shared/app_colors.dart';

class AppTheme {
  static const double borderRadius = 30.0;

  static get theme => ThemeData(
        primarySwatch: Colors.red,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.black,
          selectedItemColor: AppColors.primaryRed,
          unselectedItemColor: AppColors.white,
        ),
        primaryColor: AppColors.primaryRed,
        scaffoldBackgroundColor: AppColors.black,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.white,
            ),
          ),
          labelStyle: TextStyle(
            color: AppColors.white,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryRed),
        ),
        splashColor: AppColors.grey,
      );
}
