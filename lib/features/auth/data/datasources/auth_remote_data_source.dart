import 'package:blog_application/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUpWithEmailAndPassword(
      {required String email, required String name, required String password});

  Future<String> loginWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supaBaseClient;

  AuthRemoteDataSourceImpl(this.supaBaseClient);

  @override
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await supaBaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerException('User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signUpWithEmailAndPassword(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final response = await supaBaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
      if (response.user == null) {
        throw ServerException('User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
