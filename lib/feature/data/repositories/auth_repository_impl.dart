import 'package:dartz/dartz.dart';

import '../../domin/entities/user_entity.dart';
import '../../domin/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(
        email: email,
        password: password,
      );

      final userEntity = UserEntity(
        name: userModel.user.name,
        email: userModel.user.email,
        token: userModel.token,
        role: userModel.user.role,
        phone: userModel.user.phone,
      );

      return Right(userEntity);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    try {
      final userModel = await remoteDataSource.signup(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );

      final userEntity = UserEntity(
        name: userModel.user.name,
        email: userModel.user.email,
        token: userModel.token,
        role: userModel.user.role,
        phone: userModel.user.phone.isNotEmpty ? userModel.user.phone : phone,
      );

      return Right(userEntity);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
