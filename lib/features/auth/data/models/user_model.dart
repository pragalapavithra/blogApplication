import '../../domain/entities/User.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['user_metadata']['name'] ?? '',
      email: map['user_metadata']['email'] ?? '',
      id: map['user_metadata']['id'] ?? '',
    );
  }
}
