import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:apk_test/app/features/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Datos Estáticos para la lista de configuración
  static final List<Map<String, dynamic>> generalItems = [
    {
      'icon': FontAwesomeIcons.user,
      'text': 'Facilitador Data',
    },
    {
      'icon': FontAwesomeIcons.bell,
      'text': 'Notificaciones',
    },
    {
      'icon': FontAwesomeIcons.shieldHalved,
      'text': 'Roles y Permisos',
    },
    {
      'icon': FontAwesomeIcons.users,
      'text': 'Gestión de usuarios',
    },
    {
      'icon': FontAwesomeIcons.gear,
      'text': 'Configuración',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(18)),
              child: Icon(Icons.person,
                  size: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 6,
            ),
            const Text(
              'Cuenta de usuario',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 24),
            ),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (isUnauthenticated(state)) {
            context.go('/login');
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previus, current) {
                    if (current is AuthAuthenticated) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (isAuthenticated(state)) {
                      final user = (state as AuthAuthenticated).user;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person_outline,
                                  size: 30, color: Colors.white),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${user.name} ${user.lastName}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  user.email,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),

                const SizedBox(height: 20),

                // --- Sección General (GENERAL) ---
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'GENERAL',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),

                // --- Lista de Elementos Generales ---
                ...generalItems.map((item) {
                  return ProfileListItem(
                    icon: item['icon'] as IconData,
                    text: item['text'] as String,
                    iconColor: Colors.purple.shade300,
                  );
                }).toList(),

                const SizedBox(height: 30),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: 60.0.wp(context),
                            height: 6.0.hp(context),
                            child: TextButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(LogoutRequested());
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadowColor: Colors.grey.withOpacity(0.1),
                                elevation: 1,
                              ),
                              child: state is AuthLoading
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                          // year2023 es un parámetro no estándar; lo quito para evitar errores
                                          // year2023: true,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Cerrar sesión',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          )),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // --- Versión de la Aplicación ---
                const Center(
                  child: Text(
                    'Rock Star Data v1.0.2',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),

                // Espacio al final para que no quede pegado al NavBar
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
