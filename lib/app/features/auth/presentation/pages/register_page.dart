import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final ValueNotifier<bool> showFirstWidget = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserRegistred) {
            context.go('/login');
            Future.delayed(Duration(seconds: 1));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                backgroundColor: Colors.transparent,
                duration: const Duration(seconds: 3),
                content: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.primary, // usa tu color primario
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Usuario creado correctamente. Espera confirmación del administrador.',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is AuthFailure) {
            EasyLoadingHelper.showError(state.message);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: showFirstWidget,
                  builder: (context, value, child) {
                    return value
                        ? Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: GoogleImportCard(onManualImport: () {
                              showFirstWidget.value = false;
                            }),
                          )
                        : RegisterForm(fromGoogleImport: () {
                            showFirstWidget.value = true;
                          });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
