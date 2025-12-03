import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLocalDataSource {
  Future<Either<Failure, void>> saveLocalUser(UserEntity user);
  Future<UserModel?> getLocalUser();
  Future<void> clearData();
}
