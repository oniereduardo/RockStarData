import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dartz/dartz.dart';

class LoginUserUsecase {
  final AuthRepository repository;
  
  LoginUserUsecase(this.repository);
  
  Future<Either<Failure, UserEntity>> call(LoginRequest params) async {
    return await repository.login(params);
  }
}