import 'package:dio/dio.dart';
import 'package:ecommerce/feature/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce/feature/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce/feature/domin/repositories/auth_repository.dart';
import 'package:ecommerce/feature/domin/use_cases/login_use_case.dart';
import 'package:ecommerce/feature/domin/use_cases/signup_use_case.dart';
import 'package:ecommerce/feature/presention/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(getIt<AuthRepository>()),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<LoginUseCase>(), getIt<SignupUseCase>()),
  );
}
