import 'package:blog_application/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/User.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password});
}
