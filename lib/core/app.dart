

import 'package:flutter/material.dart';
import 'package:otlob/core/theme/app_theme.dart';
import 'package:otlob/features/sign_in/presentation/sign_in_screen.dart';

class OtlobApp extends StatelessWidget {
  const OtlobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const SignInScreen(),
    );
  }
}
