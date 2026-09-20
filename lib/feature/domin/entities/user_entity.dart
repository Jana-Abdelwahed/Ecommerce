class UserEntity {
  final String name;
  final String email;
  final String token;
  final String role;
  final String? phone;

  const UserEntity({
    required this.name,
    required this.email,
    required this.token,
    required this.role,
    this.phone,
  });
}
