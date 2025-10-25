// lib/core/services/secure_storage.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _keyToken = 'auth_token';

  // Instancia única de almacenamiento seguro
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Guarda el token JWT
  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  /// Obtiene el token JWT (o null si no existe)
  Future<String?> getToken() async {
    return _storage.read(key: _keyToken);
  }

  /// Elimina el token JWT
  Future<void> clearToken() async {
    await _storage.delete(key: _keyToken);
  }
}
