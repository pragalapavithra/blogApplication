import 'package:blog_application/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:blog_application/core/usecase/usecase.dart';
import 'package:blog_application/features/auth/domain/usecases/current_user.dart';
import 'package:blog_application/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/entities/User.dart';
import '../../domain/usecases/user_login.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc(
      {required UserSignUp userSignUp,
      required UserLogin userLogin,
      required CurrentUser currentUser,required AppUserCubit appUserCubit})
      : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial());

  void onAuthSignUp(UserParams params) async {
    emit(AuthLoading());
    final res = await _userSignUp.call(params);
    res.fold((failure) => emit(AuthFailure(failure.message)),
        (userID) => _updateUser(userID));
  }

  void onAuthLogin(UserLoginParams params) async {
    emit(AuthLoading());
    final res = await _userLogin.call(params);
    res.fold((failure) => emit(AuthFailure(failure.message)),
        (userID) => _updateUser(userID));
  }

  void isUserLoggedIn() async {
    emit(AuthLoading());
    final res = await _currentUser.call(NoParams());
    res.fold((failure) => emit(AuthFailure(failure.message)),
        (userData) => _updateUser(userData));
  }
  void _updateUser (User user){
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user)) ;
  }
}
