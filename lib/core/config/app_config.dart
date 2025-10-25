// lib/core/config/app_config.dart

class AppConfig {
  final String baseUrl;

  const AppConfig({required this.baseUrl});

  /// Configuración por defecto para el entorno de producción
  static const AppConfig prod = AppConfig(
    baseUrl: 'https://app-ecommerceapi2025.azurewebsites.net/api',
  );

  /// Configuración para entorno de desarrollo (opcional)
  static const AppConfig dev = AppConfig(
    baseUrl: 'http://localhost:5000/api',
  );

  AppConfig copyWith({String? baseUrl}) {
    return AppConfig(baseUrl: baseUrl ?? this.baseUrl);
  }
}
