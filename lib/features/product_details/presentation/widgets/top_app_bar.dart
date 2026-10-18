import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/res/app_sizes.dart';
import 'package:otlob/core/res/assets.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    this.onBackPressed,
  });

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.glazedDonuts,
          width: double.infinity,
          height: 382,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding) +
              EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 12),
          child: IconButton(
            onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
            style: IconButton.styleFrom(
              backgroundColor: Colors.black.withValues(alpha: .4),
              fixedSize: const Size(40, 40),
            ),
            icon: const Icon(CupertinoIcons.back, size: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
