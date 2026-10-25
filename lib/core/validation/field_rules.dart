import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:otlob/core/validation/phone_validation.dart';

/// Supports both synchronous and asynchronous rules.
typedef Rule = FutureOr<String?> Function(String value);

abstract final class Rules {
  /// Required rule
  static Rule required([String message = 'This field is required']) =>
      (value) => value.trim().isEmpty ? message : null;

  /// Min length rule
  static Rule minLength(int min, [String message = '']) =>
      (value) => value.trim().length < min ? message : null;

  /// Email rule
  static Rule email([String message = 'Please enter a valid email']) => (value) {
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        return emailRegex.hasMatch(value.trim()) ? null : message;
      };

  /// 👉 Phone number rule (integrated directly here!)
  static Rule phone({
    String dialCode = '+20',
    String requiredMessage = 'Please enter your phone number',
    String invalidMessage = 'Please enter a valid phone number',
  }) => (value) {
        final validation = validatePhoneNumber(
          dialCode: dialCode,
          number: value,
        );

        return switch (validation) {
          EmptyPhone() => requiredMessage,
          InvalidPhone() => invalidMessage,
          ValidPhone() => null, // Valid!
        };
      };

  /// Runs multiple rules in order
  static Rule all(List<Rule> rules) => (value) async {
        for (final rule in rules) {
          final error = await rule(value);
          if (error != null) return error;
        }
        return null;
      };
}

class SubmitField {
  final String value;
  final FocusNode focusNode;
  final Rule rule;

  const SubmitField({
    required this.value,
    required this.focusNode,
    required this.rule,
  });
}

/// Validates all fields asynchronously. Focuses the first failing field.
Future<String?> validateOnSubmit(List<SubmitField> fields) async {
  for (final field in fields) {
    final error = await field.rule(field.value);
    if (error != null) {
      field.focusNode.requestFocus();
      return error;
    }
  }
  return null;
}
