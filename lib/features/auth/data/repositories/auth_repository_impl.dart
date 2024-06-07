import 'package:blog_application/core/error/exceptions.dart';
import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_application/features/auth/data/models/user_model.dart';
import 'package:blog_application/features/auth/domain/repository/auth_repository.dart';
import "package:fpdart/src/either.dart";

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserModel>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final userId = await authRemoteDataSource.loginWithEmailAndPassword(
          email: email, password: password);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email, password: password, name: name);
      return right(userId);
    } on ServerException catch (e) {

      return left(Failure(e.message));
    }
  }
}
