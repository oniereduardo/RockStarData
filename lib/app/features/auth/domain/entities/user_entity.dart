import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String accessToken;
  final int userId;
  final String? name;
  final String? lastName;
  final String email;
  final String? phoneNumber;
  final Role? role;
  final bool? isActive;
  final DateTime? tokenExpiry;

  const UserEntity(
      {required this.accessToken,
      required this.userId,
      this.lastName,
      this.phoneNumber,
      required this.email,
      this.name,
      this.role,
      this.isActive,
      this.tokenExpiry});

  factory UserEntity.empty() {
    return UserEntity(
        accessToken: '',
        userId: 0,
        lastName: '',
        phoneNumber: '',
        email: '',
        name: '',
        role: Role.empty(),
        isActive: false,
        tokenExpiry: null);
  }

  @override
  List<Object> get props => [accessToken, userId, email];
}

class Role extends Equatable {
  final String name;

  const Role({required this.name});

  factory Role.empty() {
    return const Role(name: '');
  }

  @override
  List<Object> get props => [name];
}
