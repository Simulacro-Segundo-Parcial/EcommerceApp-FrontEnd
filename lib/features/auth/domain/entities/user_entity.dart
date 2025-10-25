// lib/features/auth/domain/entities/user_entity.dart
enum UserRole {
  admin,
  companyAdmin,
  customer,
}

class UserEntity {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final String? companyId;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.companyId,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'].toString(),
      email: json['email'] as String,
      fullName: json['fullName'] as String? ?? '',
      role: _mapRole(json['role']),
      companyId: json['companyId']?.toString(),
    );
  }

  static UserRole _mapRole(dynamic value) {
    final roleStr = value.toString().toLowerCase();
    if (roleStr.contains('admin') && !roleStr.contains('company')) {
      return UserRole.admin;
    } else if (roleStr.contains('company')) {
      return UserRole.companyAdmin;
    } else {
      return UserRole.customer;
    }
  }
}
