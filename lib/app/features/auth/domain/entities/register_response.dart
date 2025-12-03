import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final bool? isActive;

  const RegisterResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        phone,
        email,
        isActive,
      ];
}
