part of 'navbar_bloc.dart';

enum TabItem { finanzas, tableros, inicio, perfil }

class NavigationState {
  final TabItem selectedTab;

  const NavigationState(this.selectedTab);
}
