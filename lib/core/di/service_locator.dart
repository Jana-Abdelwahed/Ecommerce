import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../feature/auth/data/data_sources/auth_remote_data_source.dart';
import '../../feature/auth/data/repositories/auth_repository_impl.dart';
import '../../feature/auth/domin/repositories/auth_repository.dart';
import '../../feature/auth/domin/use_cases/login_use_case.dart';
import '../../feature/auth/domin/use_cases/signup_use_case.dart';
import '../../feature/auth/presention/cubit/auth_cubit.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {

  // Dio
  getIt.registerLazySingleton<Dio>(
        () => Dio(),
  );

  // Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(
      getIt<Dio>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      getIt<AuthRemoteDataSource>(),
    ),
  );

  // Login UseCase
  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(
      getIt<AuthRepository>(),
    ),
  );

  // Signup UseCase
  getIt.registerLazySingleton<SignupUseCase>(
        () => SignupUseCase(
      getIt<AuthRepository>(),
    ),
  );

  // Auth Cubit
  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(
      getIt<LoginUseCase>(),
      getIt<SignupUseCase>(),
    ),
  );
}