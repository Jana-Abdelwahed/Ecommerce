class UserDataModel {
  final String name;
  final String email;
  final String role;

  UserDataModel({
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
    );
  }
}