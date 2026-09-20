import 'user_data_model.dart';

class UserModel {
  final String message;
  final String token;
  final UserDataModel user;

  UserModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user: UserDataModel.fromJson(json['user'] ?? {}),
    );
  }
}