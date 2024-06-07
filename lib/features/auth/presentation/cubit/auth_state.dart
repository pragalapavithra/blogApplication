import 'package:flutter/cupertino.dart';

import '../../domain/entities/User.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{
  final User userId;

  const AuthSuccess(this.userId);
}
class AuthFailure extends AuthState{
  final String errorMessage;

  const AuthFailure(this.errorMessage);
}