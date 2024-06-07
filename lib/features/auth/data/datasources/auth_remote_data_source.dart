import 'package:blog_application/core/error/exceptions.dart';
import 'package:blog_application/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword(
      {required String email, required String name, required String password});

  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supaBaseClient;

  AuthRemoteDataSourceImpl(this.supaBaseClient);

  @override
  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await supaBaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final response = await supaBaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
      if (response.user == null) {
        throw ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
