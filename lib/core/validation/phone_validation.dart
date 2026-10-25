import 'package:dlibphonenumber/dlibphonenumber.dart';

/// The outcome of validating a phone number.
///
/// Sealed so every call site must handle all three cases — the compiler
/// enforces exhaustiveness in a `switch`, which is what lets the UI react
/// differently to "empty" (focus the field) vs "invalid" (show an error).
sealed class PhoneValidation {
  const PhoneValidation();
}

/// The number is well-formed. [e164] is the normalized form ready to be sent
/// to the backend, e.g. `+201012345678`.
final class ValidPhone extends PhoneValidation {
  final String e164;
  const ValidPhone(this.e164);
}

/// No digits were entered.
final class EmptyPhone extends PhoneValidation {
  const EmptyPhone();
}

/// Digits were entered but they don't form a valid number for the dial code.
final class InvalidPhone extends PhoneValidation {
  const InvalidPhone();
}

/// Validates [number] (the local part, without the dial code) against
/// [dialCode] (e.g. `+20` or `+966`) using dlibphonenumber.
PhoneValidation validatePhoneNumber({
  required String dialCode,
  required String number,
}) {
  final digits = number.replaceAll(RegExp(r'\D'), '');
  if (digits.isEmpty) return const EmptyPhone();

  final normalizedDialCode = dialCode.startsWith('+') ? dialCode : '+$dialCode';
  final full = '$normalizedDialCode$digits';

  try {
    final phoneUtil = PhoneNumberUtil.instance;
    final parsed = phoneUtil.parse(full, '');
    if (phoneUtil.isValidNumber(parsed)) {
      final e164 = phoneUtil.format(parsed, PhoneNumberFormat.e164);
      return ValidPhone(e164);
    }
    return const InvalidPhone();
  } catch (_) {
    return const InvalidPhone();
  }
}
