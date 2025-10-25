// lib/features/auth/data/dtos/register_user_dto.dart
class RegisterUserDto {
  final String email;
  final String password;
  final String fullName;

  const RegisterUserDto({
    required this.email,
    required this.password,
    required this.fullName,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
    };
  }
}
