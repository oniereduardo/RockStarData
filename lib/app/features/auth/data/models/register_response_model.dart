import 'package:apk_test/app/features/auth/index.dart';

class RegisterResponseModel extends RegisterResponse {
  const RegisterResponseModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.email,
    required super.isActive,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      phone: json["phone"],
      email: json["email"],
      isActive: json["isActive"],
    );
  }

  factory RegisterResponseModel.fromEntity(RegisterResponse entity) {
    return RegisterResponseModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        phone: entity.phone,
        email: entity.email,
        isActive: entity.isActive);
  }

  RegisterResponse toEntity() => RegisterResponse(
        id: id,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        isActive: isActive,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "isActive": isActive,
      };
}
