import 'package:blog_application/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class AuthFieldGradientButton extends StatelessWidget {
  final String buttonText;

  const AuthFieldGradientButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppPallete.gradient1,
              AppPallete.gradient2,
            ],
          ),
          borderRadius: BorderRadius.circular(8)),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(screenWidth, screenHeight * 0.07),
          backgroundColor: AppPallete.transparentColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
