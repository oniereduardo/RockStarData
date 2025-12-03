import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(LoginRequest params);
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest params);
  Future<Either<Failure, void>> saveLocalUser(UserEntity user);
  Future<Either<Failure, UserModel?>> getLocalUser();
  Future<void> cleanData();
}
