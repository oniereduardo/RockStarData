import 'package:bloc/bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(TabItem.finanzas)) {
    on<NavigationEvent>((event, emit) {
      emit(NavigationState(event.newTab));
    });
  }
}
