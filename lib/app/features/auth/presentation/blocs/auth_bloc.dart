import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUsecase loginUser;
  final RegisterUserUseCases registerUser;
  final GetLocalUserUsecase getLocalUser;
  final SaveLocalUserUsecase saveLocalUser;
  final CleanDataUsecase cleanData;

  AuthBloc({
    required this.loginUser,
    required this.registerUser,
    required this.getLocalUser,
    required this.saveLocalUser,
    required this.cleanData,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final userResult = await getLocalUser();

      await userResult.fold((failure) async {
        await cleanData.call();
        emit(AuthUnauthenticated());
      }, (user) async {
        final validationResult = _validateAccessToken(user?.tokenExpiry);

        if (validationResult) {
          emit(AuthAuthenticated(user!));
        } else {
          await cleanData.call();
          emit(AuthUnauthenticated());
        }
      });
    } catch (e) {
      await cleanData.call();
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final result = await loginUser(
        LoginRequest(
          email: event.email,
          password: event.password,
        ),
      );

      await result.fold(
        (failure) async {
          emit(AuthFailure(failure.errorMessage));
        },
        (user) async {
          try {
            await saveLocalUser(user);
            emit(AuthAuthenticated(user));
          } catch (e) {
            final errorMessage =
                FailureMapper.mapFailureToMessage(e as Failure);
            emit(AuthFailure(errorMessage));
          }
        },
      );
    } catch (e) {
      final errorMessage = FailureMapper.mapFailureToMessage(e as Failure);
      emit(AuthFailure(errorMessage));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final result = await registerUser(
        RegisterRequest(
            name: event.name,
            lastName: event.lastName,
            email: event.email,
            password: event.password,
            phoneNumber: event.phoneNumber,
            // address: event.address,
            // locality: event.locality,
            // country: event.country
            isActive: true),
      );

      await result.fold(
        (failure) async {
          emit(AuthFailure(failure.errorMessage));
        },
        (response) async {
          try {
            emit(UserRegistred(response));
          } catch (e) {
            final errorMessage =
                FailureMapper.mapFailureToMessage(e as Failure);
            emit(AuthFailure(errorMessage));
          }
        },
      );
    } catch (e) {
      final errorMessage = FailureMapper.mapFailureToMessage(e as Failure);
      emit(AuthFailure(errorMessage));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    await cleanData.call();
    emit(AuthUnauthenticated());
  }

  bool _validateAccessToken(DateTime? tokenExpiry) {
    return tokenExpiry != null && DateTime.now().isBefore(tokenExpiry);
  }
}
