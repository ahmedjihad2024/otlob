import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  final String title;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: onBackPressed ?? () => context.maybePop(),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Icon(
                CupertinoIcons.back,
                size: 20,
                color: Color(0xFF111827),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}
