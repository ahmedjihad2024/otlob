import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/app.dart';
import 'package:otlob/core/config/constants.dart';
import 'package:otlob/core/config/supported_locales.dart';
import 'package:otlob/core/di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  runApp(
    EasyLocalization(
      supportedLocales: SupportedLocales.allLocales,
      startLocale: SupportedLocales.EN.locale,
      path: Constants.translationsPath,
      child: const MyApp(),
    ),
  );
}

// dart pub global activate flutter_gen
// fluttergen -c .\pubspec.yaml
