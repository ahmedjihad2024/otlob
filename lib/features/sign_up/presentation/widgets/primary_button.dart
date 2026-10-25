import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlob/core/res/color_manager.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: ColorM.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 23.22 / 17,
          ),
        ),
      ),
    );
  }
}
