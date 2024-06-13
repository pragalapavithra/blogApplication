import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/features/auth/domain/repository/auth_repository.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/common/entities/User.dart';
import '../../../../core/usecase/usecase.dart';

class CurrentUser extends UseCase<User,NoParams>{
  AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async{
    return await authRepository.getCurrentUser();
  }

}
