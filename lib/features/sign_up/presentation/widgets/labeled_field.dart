import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlob/core/res/color_manager.dart';

class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ColorM.primary,
            height: 19.12 / 14,
          ),
        ),
        const SizedBox(height: 7),
        SizedBox(
          height: 45,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              hintText: hint,
              hintStyle: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: obscureText ? ColorM.passwordHint : ColorM.placeholder,
                height: 19.12 / 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorM.fieldBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorM.fieldBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorM.primary, width: 1.5),
              ),
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
