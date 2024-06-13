import 'package:blog_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_application/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_application/features/auth/domain/usecases/user_login.dart';
import 'package:blog_application/features/auth/presentation/cubit/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/app_secrets/app_secrets.dart';
import 'features/auth/domain/usecases/user_sign_up.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supaBase = await Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    anonKey: AppSecrets.supaBaseApiKey,
  );
  serviceLocator.registerLazySingleton(() => supaBase.client);
  _initAuth();
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(serviceLocator()))
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerLazySingleton(() =>
        AuthBloc(userSignUp: serviceLocator(), userLogin: serviceLocator()));
}
