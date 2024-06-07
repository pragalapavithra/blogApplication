import 'package:blog_application/core/app_secrets/app_secrets.dart';
import 'package:blog_application/core/theme/theme.dart';
import 'package:blog_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_application/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/pages/login_page.dart';
import 'package:blog_application/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supaBase = await  Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    anonKey: AppSecrets.supaBaseApiKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthBloc(
              userSignUp: UserSignUp(AuthRepositoryImpl(
                  AuthRemoteDataSourceImpl(supaBase.client)))))
    ],
    child: const MyApp(),
  ));
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
