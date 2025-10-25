// lib/features/auth/data/dtos/auth_response_dto.dart
import '../../domain/entities/user_entity.dart';

class AuthResponseDto {
  final String token;
  final UserEntity user;

  const AuthResponseDto({
    required this.token,
    required this.user,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
