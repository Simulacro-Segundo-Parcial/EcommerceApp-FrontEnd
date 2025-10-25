// lib/core/routing/app_router.dart
import 'package:flutter/material.dart';

class AppRouter {
  // Definimos las rutas como constantes
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  // Método central para generar rutas
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Splash Screen')),
          ),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Login Screen')),
          ),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Home Screen')),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
