import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dartz/dartz.dart';

class GetLocalUserUsecase {
  final AuthRepository repository;

  GetLocalUserUsecase(this.repository);

  Future<Either<Failure, UserEntity?>> call() async {
    return await repository.getLocalUser();
  }
}
