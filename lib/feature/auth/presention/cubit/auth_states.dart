import '../../domin/entities/user_entity.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthLoginSuccess extends AuthState {
  final UserEntity user;

  const AuthLoginSuccess(this.user);
}

class AuthLoginFailure extends AuthState {
  final String message;

  const AuthLoginFailure(this.message);
}

class AuthSignupSuccess extends AuthState {
  final UserEntity user;

  const AuthSignupSuccess(this.user);
}

class AuthSignupFailure extends AuthState {
  final String message;

  const AuthSignupFailure(this.message);
}