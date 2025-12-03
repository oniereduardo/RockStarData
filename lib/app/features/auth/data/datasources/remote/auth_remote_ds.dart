import 'package:apk_test/app/features/auth/index.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(LoginRequestModel params);
  Future<RegisterResponseModel> register(RegisterRequestModel params);
}
