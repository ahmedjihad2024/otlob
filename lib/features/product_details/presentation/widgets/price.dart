import 'package:flutter/material.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/sizes_manager.dart';

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            "180",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: ColorM.primary,
            ),
          ),
          SizedBox(width: 6),
          Text(
            "EGP",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF9CA3AF),
              letterSpacing: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
