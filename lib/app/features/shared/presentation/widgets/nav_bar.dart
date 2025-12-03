import 'package:apk_test/app/features/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha el estado actual para saber qué ítem resaltar
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: TabItem.values.indexOf(state.selectedTab),
          onTap: (index) {
            // Emite el evento al presionar una pestaña
            context.read<NavigationBloc>().add(
                  NavigationEvent(TabItem.values[index]),
                );
          },
          type: BottomNavigationBarType.fixed, // Asegura que todos los ítems sean visibles
          selectedItemColor: Colors.purple, // Color de la pestaña seleccionada
          unselectedItemColor: Colors.grey, // Color de las pestañas no seleccionadas
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.clock), // Icono de Finanzas (similar a la imagen)
              label: 'Finanzas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), // Icono de Tableros
              label: 'Tableros',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Icono de Inicio
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), // Icono de Perfil
              label: 'Perfil',
            ),
          ],
        );
      },
    );
  }
}