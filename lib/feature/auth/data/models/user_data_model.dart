class UserDataModel {
  final String name;
  final String email;
  final String role;
  final String phone;

  UserDataModel({
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
