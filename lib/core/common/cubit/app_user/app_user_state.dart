import 'package:flutter/cupertino.dart';

import '../../entities/User.dart';

@immutable
abstract class AppUserState{}

class AppUserInitial extends AppUserState{}
class AppUserLoggedIn extends AppUserState{
  final User user;

  AppUserLoggedIn(this.user);
}