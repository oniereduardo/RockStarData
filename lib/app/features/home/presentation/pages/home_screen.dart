import 'package:apk_test/app/features/finanzas/index.dart';
import 'package:apk_test/app/features/profile/index.dart';
import 'package:apk_test/app/features/shared/index.dart';
import 'package:apk_test/app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _getBodyForTab(TabItem tab) {
    switch (tab) {
      case TabItem.finanzas:
        return const FinanzasScreen();
      case TabItem.tableros:
        return const Center(child: Text('Tableros - Vista en construcción'));
      case TabItem.inicio:
        return const Center(child: Text('Inicio - Vista en construcción'));
      case TabItem.perfil:
        return const ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios de estado del Bloc para cambiar el body
    return BlocProvider(
      create: (context) => sl<NavigationBloc>(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          // Usamos un Scaffold con FinanzasScreen como body
          // y CustomNavBar como la barra de navegación inferior.
          return BasePage(
            // Construye el body dependiendo del estado del Bloc
            body: _getBodyForTab(state.selectedTab),
            // Coloca el widget independiente del NavBar
            bottomNavigationBar: const CustomNavBar(),
          );
        },
      ),
    );
  }
}
