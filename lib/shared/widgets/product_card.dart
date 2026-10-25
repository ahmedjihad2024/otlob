import 'package:flutter/material.dart';

export 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.badgeText,
    this.isFilterStyle = false,
  });

  final ProductItem product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final String? badgeText;
  final bool isFilterStyle;

  @override
  Widget build(BuildContext context) {
    final displayBadge = badgeText ?? product.category;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(isFilterStyle ? 16 : 20),
      child: Container(
        padding: isFilterStyle ? const EdgeInsets.all(8) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isFilterStyle ? 16 : 20),
          border: isFilterStyle
              ? null
              : Border.all(color: const Color(0xFFF3F4F6), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: isFilterStyle ? 10 : 16,
              offset: Offset(0, isFilterStyle ? 3 : 4),
            ),
          ],
        ),
        clipBehavior: isFilterStyle ? Clip.none : Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isFilterStyle ? 12 : 0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    product.imageAsset.startsWith('http://') ||
                            product.imageAsset.startsWith('https://')
                        ? Image.network(
                            product.imageAsset,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: const Color(0xFFF3F4F6),
                              child: const Icon(
                                Icons.image_not_supported_outlined,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          )
                        : Image.asset(
                            product.imageAsset,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: const Color(0xFFF3F4F6),
                              child: const Icon(
                                Icons.image_not_supported_outlined,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ),
                    if (displayBadge.isNotEmpty)
                      Positioned(
                        top: isFilterStyle ? 6 : 10,
                        left: isFilterStyle ? 6 : 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isFilterStyle ? 8 : 10,
                            vertical: isFilterStyle ? 4 : 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(
                              alpha: isFilterStyle ? 0.55 : 0.65,
                            ),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            displayBadge,
                            style: TextStyle(
                              fontSize: isFilterStyle ? 10 : 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(isFilterStyle ? 8 : 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isFilterStyle ? product.brand.toUpperCase() : product.brand,
                    style: TextStyle(
                      fontSize: isFilterStyle ? 11 : 12,
                      fontWeight:
                          isFilterStyle ? FontWeight.w700 : FontWeight.w600,
                      color: const Color(0xFFFF5C39),
                      letterSpacing: isFilterStyle ? 0.3 : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: isFilterStyle ? 13 : 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111827),
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: isFilterStyle ? 8 : 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: product.price.toInt().toString(),
                              style: TextStyle(
                                fontSize: isFilterStyle ? 16 : 18,
                                fontWeight: isFilterStyle
                                    ? FontWeight.w800
                                    : FontWeight.w700,
                                color: const Color(0xFF111827),
                              ),
                            ),
                            const TextSpan(
                              text: " EGP",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: onAddToCart,
                        borderRadius: BorderRadius.circular(
                          isFilterStyle ? 8 : 999,
                        ),
                        child: Container(
                          width: isFilterStyle ? 28 : 32,
                          height: isFilterStyle ? 28 : 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5C39),
                            borderRadius: isFilterStyle
                                ? BorderRadius.circular(8)
                                : null,
                            shape: isFilterStyle
                                ? BoxShape.rectangle
                                : BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: isFilterStyle ? 16 : 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
