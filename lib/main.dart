import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/app.dart';
import 'package:otlob/core/config/constants.dart';
import 'package:otlob/core/config/supported_locales.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/res/router/app_router.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();

  final hasToken = await sl<StorageService>().hasToken();
  appRouter = createAppRouter(
    initialLocation: hasToken ? Routes.home.path : Routes.auth.path,
  );

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
