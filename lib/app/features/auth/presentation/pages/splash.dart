import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Solo manejar estados finales, no intermedios
        if (state is AuthAuthenticated) {
          context.go('/home');
        } else if (state is AuthUnauthenticated || state is AuthFailure) {
          context.go('/login');
        }
        // Dejar que AuthPage maneje AuthInitial y AuthLoading
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
                year2023: true,
              ),
              SizedBox(height: 24),
              Text('Cargando...',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
