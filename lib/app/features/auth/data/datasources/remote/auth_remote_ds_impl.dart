import 'dart:convert';

import 'package:apk_test/app/core/index.dart';
import 'package:apk_test/app/features/auth/index.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(LoginRequestModel params) async {
    try {
      // final response = await client.post('/auth/login', data: params.toJson());

      final response = await http.post(
        Uri.parse('${Constants.baseAuthUrl}/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = jsonDecode(response.body)['access_token'] as String?;
        if (token == null || token.isEmpty) {
          throw Exception('access_token missing in login response');
        }

        final accessToken = JwtDecoder.decode(token);

        final user = UserModel(
          accessToken: token,
          name: accessToken['name'],
          lastName: accessToken['lastName'],
          phoneNumber: accessToken['phone'],
          email: accessToken['email'] ?? '',
          userId: accessToken['sub'] ?? '',
          tokenExpiry:
              DateTime.fromMillisecondsSinceEpoch(accessToken['exp'] * 1000),
        );
        print('----------------------------->>>>>>>>>>>>> $user');
        return user;
      } else if (response.statusCode == 401) {
          throw ServerException(message: 'Crdenciales invalidas');
      } else {
        throw ServerException(message: 'Login error');
      }
    } on DioException catch (e) {
      // Re-throw Dio errors with some context
      throw Exception('Login request failed: ${e.message}');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel params) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseAuthUrl}/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params.toJson()),
      );
      // final response = await client.post('/users',
      //     data: RegisterRequestModel.fromEntity(params).toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        return RegisterResponseModel.fromJson(json);
      } else if (response.statusCode == 400) {
        throw ServerException(message: '	Invalid data or user already exists');
      } else {
        throw Exception('register failed: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('register request failed: ${e.message}');
    }
  }
}
