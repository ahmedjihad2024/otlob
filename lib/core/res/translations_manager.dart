// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';

enum Translation {
  // static
  search_country,
  app_name,

  // Loading States
  loading,
  no_more,
  failed_loading,
  load_more,
  retry_button,

  // Error Messages
  error_invalid_number,
  error_invalid_email,
  error_server,
  error_no_internet,
  error_generic,
  user_not_confirmed,
  unauthorized,
  email_taken,
  incorrect_password_or_email,
}

extension Tra on Translation {
  String get tr => name.tr();
  String trNamed(Map<String, String> params) => name.tr(namedArgs: params);
}
