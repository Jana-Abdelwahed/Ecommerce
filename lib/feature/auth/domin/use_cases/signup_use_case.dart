import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    return await repository.signup(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}