import 'package:blog_application/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:blog_application/core/common/cubit/app_user/app_user_state.dart';
import 'package:blog_application/core/theme/theme.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/pages/login_page.dart';
import 'package:blog_application/features/blog/pages/blog_page.dart';
import 'package:blog_application/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
    BlocProvider(create: (_) => serviceLocator<AppUserCubit>())
  ], child: FirstPage()));
}

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().isUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: AppTheme.backgroundColor,
    );
  }
}
