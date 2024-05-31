import 'package:blog_application/core/theme/theme.dart';
import 'package:blog_application/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Application',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.backgroundColor,
      home: const SignUpPage(),
    );
  }
}
