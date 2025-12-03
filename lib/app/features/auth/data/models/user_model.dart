import 'dart:convert';

import 'package:apk_test/app/features/auth/index.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.accessToken,
    required super.name,
    required super.lastName,
    required super.email,
    required super.userId,
    super.phoneNumber,
    super.role,
    super.tokenExpiry,
    super.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'],
      userId: json['userId'],
      name: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phone'],
      tokenExpiry: DateTime.parse(json['tokenExpiry']),
      isActive: json['isActive'],
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
        name: entity.name,
        lastName: entity.lastName,
        email: entity.email,
        accessToken: entity.accessToken,
        userId: entity.userId,
        role: entity.role,
        isActive: entity.isActive,
        tokenExpiry: entity.tokenExpiry);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      accessToken: map['accessToken'] ?? '',
      userId: map['userId'] ?? '',
      name: map['firstName'],
      lastName: map['lastName'],
      email: map['email'] ?? '',
      role: RoleModel.fromMap(map['role']),
      isActive: map['isActive'],
    );
  }

  UserEntity toEntity() => UserEntity(
        accessToken: accessToken,
        userId: userId,
        name: name,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        role: role,
        tokenExpiry: tokenExpiry,
        isActive: isActive,
      );

  UserModel copyWith({
    String? accessToken,
    int? userId,
    String? name,
    String? lastName,
    String? email,
    String? phoneNumber,
    RoleModel? role,
    bool? isActive,
    DateTime? tokenExpiry,
  }) {
    return UserModel(
      accessToken: accessToken ?? this.accessToken,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      tokenExpiry: tokenExpiry ?? this.tokenExpiry,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'userId': userId,
      'firstName': name,
      'lastName': lastName,
      'email': email,
      'phone': phoneNumber,
      'role': jsonEncode(role),
      'isActive': isActive,
      'tokenExpiry': tokenExpiry?.toIso8601String(),
    };
  }
}

class RoleModel extends Role {
  const RoleModel({
    required super.name,
  });

  factory RoleModel.fromMap(Map<String, List<dynamic>> map) {
    return RoleModel(
      name: map['name']?.first ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
