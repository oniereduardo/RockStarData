import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:apk_test/app/features/auth/index.dart';

Future<void> initAuthInjection(GetIt sl) async {
  // DataSources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(secureStorage: sl()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl<Dio>(instanceName: 'authDio')),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => LoginUserUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUserUseCases(sl()));
  sl.registerLazySingleton(() => GetLocalUserUsecase(sl()));
  sl.registerLazySingleton(() => SaveLocalUserUsecase(sl()));
  sl.registerLazySingleton(() => CleanDataUsecase(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(
        loginUser: sl(),
        registerUser: sl(),
        getLocalUser: sl(),
        saveLocalUser: sl(),
        cleanData: sl(),
      ));
}
