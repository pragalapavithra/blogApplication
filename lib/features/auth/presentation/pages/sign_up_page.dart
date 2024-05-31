import 'package:blog_application/core/theme/app_pallette.dart';
import 'package:blog_application/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_application/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up .',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const AuthField(hintText: "Name"),
            const SizedBox(
              height: 16,
            ),
            const AuthField(hintText: "Email"),
            const SizedBox(
              height: 16,
            ),
            const AuthField(hintText: "Password"),
            const SizedBox(
              height: 16,
            ),
            const AuthFieldGradientButton(
              buttonText: 'Sign Up',
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                text: "Already have an account ? ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                      text: 'Sign In',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppPallete.gradient2,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
