import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dartz/dartz.dart';

class RegisterUserUseCases {
  final AuthRepository repository;

  RegisterUserUseCases(this.repository);

  Future<Either<Failure, RegisterResponse>> call(RegisterRequest params) async {
    return await repository.register(params);
  }
}
