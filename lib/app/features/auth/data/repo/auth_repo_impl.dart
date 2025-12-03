import 'package:apk_test/app/core/index.dart';
import 'package:dartz/dartz.dart';

import 'package:apk_test/app/features/auth/index.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<void> cleanData() async {
    await localDataSource.clearData();
  }

  @override
  Future<Either<Failure, UserModel?>> getLocalUser() async {
    try {
      final userModel = await localDataSource.getLocalUser();
      if (userModel != null) {
        return Right(userModel);
      } else {
        return Left(CacheFailure(errorMessage: 'No hay datos almacenados'));
      }
    } catch (e) {
      return Left(
          CacheFailure(errorMessage: 'Error retrieving local user: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest params) async {
    try {
      final user =
          await remoteDataSource.login(LoginRequestModel.fromEntity(params));
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest params) async {
    try {
      final response = await remoteDataSource
          .register(RegisterRequestModel.fromEntity(params));
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveLocalUser(UserEntity user) async {
    try {
      await localDataSource.saveLocalUser(user);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(errorMessage: e.message));
    }
  }
}
