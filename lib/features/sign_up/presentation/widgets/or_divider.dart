import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otlob/core/res/app_colors.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.black, thickness: 0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'Or With',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.muted,
              height: 19.12 / 14,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.black, thickness: 0.5)),
      ],
    );
  }
}
