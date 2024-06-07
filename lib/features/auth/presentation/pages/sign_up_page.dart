import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blog_application/core/common/routes/routes.dart';
import 'package:blog_application/core/common/widgets/loader.dart';
import 'package:blog_application/core/theme/app_pallette.dart';
import 'package:blog_application/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_state.dart';
import 'package:blog_application/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_application/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_snackbar.dart';

@RoutePage(name: 'SignUpPageRouter')
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showSnackBar(context, state.errorMessage);
              } else if (state is AuthSuccess) {

              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                const Loader();
              }
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up .',
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthField(
                      hintText: "Name",
                      textEditingController: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthField(
                      hintText: "Email",
                      textEditingController: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthField(
                      hintText: "Password",
                      textEditingController: passwordController,
                      isObscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthFieldGradientButton(
                      buttonText: 'Sign Up',
                      onButtonPress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().onAuthSignUp(UserParams(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim()));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: (){
                        context.router.replace(const LoginPageRouter());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account ? ",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                          children: [
                            TextSpan(
                                text: 'Sign In',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
