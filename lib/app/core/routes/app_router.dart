import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:apk_test/app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_appRouter);
}

final GoRouter _appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: RouteName.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: RouteName.register,
      builder: (context, state) {
        return RegisterPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  redirect: (context, state) {
    // Lógica de redirección centralizada si es necesaria
    return null;
  },
);
