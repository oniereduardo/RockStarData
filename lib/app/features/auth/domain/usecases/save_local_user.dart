import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dartz/dartz.dart';

class SaveLocalUserUsecase {
  final AuthRepository repository;

  SaveLocalUserUsecase(this.repository);

  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repository.saveLocalUser(user);
  }
}
