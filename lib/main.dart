import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'app.dart';

void main() {
  const config = AppConfig(
    baseUrl: 'https://app-ecommerceapi2025.azurewebsites.net/api',
  );

  runApp(MyApp(config: config));
}
