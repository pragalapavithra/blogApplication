import 'package:blog_application/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial());

  void onAuthSignUp(UserParams params) async {
    emit(AuthLoading());
    final res = await _userSignUp.call(params);
    res.fold((failure) => emit(AuthFailure(failure.message)),
        (userID) => emit(AuthSuccess(userID)));
  }
}
