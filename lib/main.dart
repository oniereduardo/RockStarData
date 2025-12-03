import 'dart:io';

import 'package:apk_test/app/app_test.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:apk_test/app/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/core/index.dart';

void main() async {
  try {
    await init();

    configEasyLoading();
    if (kDebugMode) {
      HttpOverrides.global = MyHttpOverrides();
    }

    initializeDateFormatting('es_ES', null).then(
      (_) => runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<RouterCubit>(create: (context) => sl()),
            BlocProvider(
                create: (context) => sl<AuthBloc>()..add(CheckAuthStatus())),
          ],
          child: const AppTest(),
        ),
      ),
    );
  } catch (e) {
    print('Error durante la inicialización: $e');
    // Fallback app en caso de error
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error de inicialización: $e')),
        ),
      ),
    );
  }
}