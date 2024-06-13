import 'package:auto_route/auto_route.dart';
import 'package:blog_application/core/common/routes/routes.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/cubit/app_user/app_user_state.dart';
import '../cubit/auth_state.dart';

@RoutePage(name: "SplashPageRouter")
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().isUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, bool>(
      builder: (context, isUserLoggedIn) {
        if (isUserLoggedIn) {
          context.router.replace(const BlogPageRouter());
        } else {
          context.router.replace(const LoginPageRouter());
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      selector: (state) {
        return state is AppUserLoggedIn;
      },
    );
  }
}
