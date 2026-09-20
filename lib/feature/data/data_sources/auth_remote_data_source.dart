import 'package:dio/dio.dart';
import '../../../../core/constant/api_constants.dart';
import '../../../../core/constant/api_endpoints.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '${ApiConstants.baseUrl}${ApiEndpoints.login}',
        data: {
          "email": email,
          "password": password,
        },
      );

      return UserModel.fromJson(response.data);

    } catch (e) {
      if (e is DioException && e.response != null) {
        throw e.response?.data['message'] ?? 'Authentication failed';
      }
      throw 'Something went wrong, please try again';
    }
  }

  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        '${ApiConstants.baseUrl}${ApiEndpoints.signup}',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
      );

      return UserModel.fromJson(response.data);

    } catch (e) {
      if (e is DioException && e.response != null) {
        throw e.response?.data['message'] ?? 'Sign up failed';
      }
      throw 'Something went wrong, please try again';
    }
  }
}