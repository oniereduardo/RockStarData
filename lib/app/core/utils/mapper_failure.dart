import 'package:apk_test/app/core/index.dart';

class FailureMapper {
  static String mapFailureToMessage(Failure failure) {
    if (failure is UnauthorizedFailure) {
      return failure.errorMessage;
    } else if (failure is NetworkFailure) {
      return 'Error de red';
    } else if (failure is ServerFailure) {
      return 'Error del servidor';
    } else if (failure is CacheFailure) {
      return 'Error de caché';
    }
    return 'Error desconocido';
  }
}
