import 'package:blog_application/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border(
      [Color borderColor = AppPallete.borderColor]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor));
  }

  static var backgroundColor = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: _border(),
          focusedBorder: _border(AppPallete.gradient2)));
}
