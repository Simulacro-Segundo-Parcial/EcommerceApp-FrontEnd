// lib/app.dart
import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'core/services/secure_storage.dart';
import 'core/services/network_client.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final AppConfig config;
  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    // Inicializamos los servicios base
    final storage = SecureStorage();
    // ignore: unused_local_variable
    final client = NetworkClient(
      baseUrl: config.baseUrl,
      getToken: storage.getToken,
    );

    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
