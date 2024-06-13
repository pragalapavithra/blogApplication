import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/core/usecase/usecase.dart';
import 'package:blog_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

import '../entities/User.dart';

class UserLogin extends UseCase<User, UserLoginParams> {
  AuthRepository authRepository;

  UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  String email;
  String password;

  UserLoginParams(this.email, this.password);
}
