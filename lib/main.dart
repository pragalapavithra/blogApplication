import 'package:blog_application/core/theme/theme.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/pages/login_page.dart';
import 'package:blog_application/features/auth/presentation/pages/sign_up_page.dart';
import 'package:blog_application/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>())],
      child: FirstPage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Application',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.backgroundColor,
      home: const LoginPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
