import 'package:apk_test/app/features/auth/index.dart';

class CleanDataUsecase {
  final AuthRepository repository;

  CleanDataUsecase(this.repository);

  Future<void> call() async {
    return await repository.cleanData();
  }
}
