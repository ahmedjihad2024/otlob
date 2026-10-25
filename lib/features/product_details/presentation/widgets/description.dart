import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ABOUT THIS ITEM",
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Classic ring donuts hand-dipped in a signature sugar glaze while still warm from the fryer. Light, pillowy and irresistibly sweet.",
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
