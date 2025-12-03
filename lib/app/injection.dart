import 'dart:io';
import 'package:apk_test/app/features/shared/index.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Configuración de Dio con seguridad
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();

    // Configurar opciones
    dio.options = BaseOptions(
      baseUrl: Constants.baseAuthUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    // Configurar adapter para cada plataforma
    if (Platform.isAndroid || Platform.isIOS) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();

          // Configuración específica para móvil
          client.badCertificateCallback = (cert, host, port) {
            // Solo en desarrollo, quitar en producción
            if (kDebugMode) {
              debugPrint('Accepting certificate for $host');
              return true;
            }
            return false; // En producción, validar certificados
          };

          // Timeouts específicos
          client.connectionTimeout = const Duration(seconds: 30);
          client.idleTimeout = const Duration(seconds: 30);

          return client;
        },
      );
    }

    // Interceptores - el TokenInterceptor primero
    dio.interceptors.addAll([
      // TokenInterceptor debe ir primero
      TokenInterceptor(dio: dio, authLocalDataSource: sl()),

      // Log interceptor (solo desarrollo)
      if (kDebugMode)
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          logPrint: (log) => debugPrint('DIO: $log'),
        ),

      // QueuedInterceptor al final
      QueuedInterceptorsWrapper(),
    ]);

    return dio;
  }, instanceName: 'authDio');

  // Secure Storage
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    ),
  );

  sl.registerFactory(() => RouterCubit());
  sl.registerFactory(() => NavigationBloc());

  initAuthInjection(sl);
}
