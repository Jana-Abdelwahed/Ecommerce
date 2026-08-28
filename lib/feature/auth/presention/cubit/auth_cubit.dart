import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domin/use_cases/login_use_case.dart';
import '../../domin/use_cases/signup_use_case.dart';
import 'auth_states.dart';


class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;

  AuthCubit(
      this.loginUseCase,
      this.signupUseCase,
      ) : super(const AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    final result = await loginUseCase(
      email: email,
      password: password,
    );

    result.fold(
          (failure) {
        emit(AuthLoginFailure(failure));
      },
          (user) {
        emit(AuthLoginSuccess(user));
      },
    );
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    emit(const AuthLoading());

    final result = await signupUseCase(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );

    result.fold(
          (failure) {
        emit(AuthSignupFailure(failure));
      },
          (user) {
        emit(AuthSignupSuccess(user));
      },
    );
  }
}