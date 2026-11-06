import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/core/res/sizes_manager.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    this.imageUrl,
    this.onBackPressed,
  });

  final String? imageUrl;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    final hasNetworkImage = imageUrl != null &&
        (imageUrl!.startsWith('http://') || imageUrl!.startsWith('https://'));

    return Stack(
      children: [
        if (hasNetworkImage)
          CachedNetworkImage(
            imageUrl: imageUrl!,
            width: double.infinity,
            height: 382,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(
              width: double.infinity,
              height: 382,
              color: const Color(0xFFF3F4F6),
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (_, __, ___) => Image.asset(
              Assets.images.glazedDonuts.path,
              width: double.infinity,
              height: 382,
              fit: BoxFit.cover,
            ),
          )
        else if (imageUrl != null && imageUrl!.isNotEmpty)
          Image.asset(
            imageUrl!,
            width: double.infinity,
            height: 382,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Image.asset(
              Assets.images.glazedDonuts.path,
              width: double.infinity,
              height: 382,
              fit: BoxFit.cover,
            ),
          )
        else
          Image.asset(
            Assets.images.glazedDonuts.path,
            width: double.infinity,
            height: 382,
            fit: BoxFit.cover,
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeM.pagePadding) +
              EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 12),
          child: IconButton(
            onPressed: onBackPressed ?? () => context.maybePop(),
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
