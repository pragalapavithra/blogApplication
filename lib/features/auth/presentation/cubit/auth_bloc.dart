import 'package:blog_application/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/user_login.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;

  AuthBloc({required UserSignUp userSignUp,required UserLogin userLogin})
      : _userSignUp = userSignUp,_userLogin = userLogin,
        super(AuthInitial());

  void onAuthSignUp(UserParams params) async {
    emit(AuthLoading());
    final res = await _userSignUp.call(params);
    res.fold((failure) => emit(AuthFailure(failure.message)),
        (userID) => emit(AuthSuccess(userID)));
  }

  void onAuthLogin(UserLoginParams params) async {
    emit(AuthLoading());
    final res = await _userLogin.call(params);
    res.fold((failure) => emit(AuthFailure(failure.message)),
            (userID) => emit(AuthSuccess(userID)));
  }
}
