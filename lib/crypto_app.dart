import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: darkTheme, routes: routes);
  }
}
