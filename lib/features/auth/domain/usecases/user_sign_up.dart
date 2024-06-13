import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/core/usecase/usecase.dart';
import 'package:blog_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/common/entities/User.dart';

class UserSignUp extends UseCase<User, UserParams> {
  AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserParams {
  String name;
  String email;
  String password;

  UserParams(this.name, this.email, this.password);
}
