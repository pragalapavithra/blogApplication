import 'package:auto_route/auto_route.dart';
import 'package:blog_application/core/common/cubit/app_user/app_user_state.dart';
import 'package:blog_application/core/common/routes/routes.dart';
import 'package:blog_application/core/theme/app_pallette.dart';
import 'package:blog_application/core/utils/show_snackbar.dart';
import 'package:blog_application/features/auth/domain/usecases/user_login.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_state.dart';
import 'package:blog_application/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_application/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/cubit/app_user/app_user_cubit.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../blog/pages/blog_page.dart';

@RoutePage(name: 'LoginPageRouter')
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
            listener: (BuildContext context, Object? state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.errorMessage);
          } else if (state is AuthSuccess) {
            context.router.push(const BlogPageRouter());
          }
        }, builder: (BuildContext context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In .',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
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
                  buttonText: 'Sign In',
                  onButtonPress: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().onAuthLogin(UserLoginParams(
                          emailController.text, passwordController.text));
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.replace(const SignUpPageRouter());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account ? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                            text: 'Sign Up',
                            style: Theme.of(context)
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
        }),
      ),
    );
  }
}
