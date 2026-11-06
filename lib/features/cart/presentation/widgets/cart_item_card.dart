import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';

class CartItemCard extends StatelessWidget {
  final BasketItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool isUpdating;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    this.isUpdating = false,
  });

  Widget _buildProductImage() {
    // If URL starts with http, use CachedNetworkImage with local asset fallback
    if (item.pictureUrl.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: item.pictureUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) => Container(
          color: const Color(0xFFF3F4F6),
          child: const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: ColorM.primary),
            ),
          ),
        ),
        errorWidget: (context, url, error) => _buildFallbackAssetImage(),
      );
    }
    return _buildFallbackAssetImage();
  }

  Widget _buildFallbackAssetImage() {
    // Choose appropriate asset based on product name
    final nameLower = item.productName.toLowerCase();
    if (nameLower.contains('caramel') || nameLower.contains('frappuccino')) {
      return Assets.images.doubleCaramelFrappuccino.image(fit: BoxFit.contain);
    } else if (nameLower.contains('mocha') || nameLower.contains('chocolate')) {
      return Assets.images.darkChocolateMocha.image(fit: BoxFit.contain);
    } else if (nameLower.contains('cheesecake')) {
      return Assets.images.blueberryCheesecake.image(fit: BoxFit.contain);
    } else if (nameLower.contains('donut')) {
      return Assets.images.glazedDonuts.image(fit: BoxFit.contain);
    }
    return Assets.images.vanillaLatte.image(fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 80x80 product image container
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: _buildProductImage(),
          ),
          const SizedBox(width: 16),

          // Details column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  item.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0A192F),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),

                // Brand · Category
                Text(
                  '${item.brand} · ${item.category}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 12),

                // Price and quantity stepper
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price
                    Text(
                      '${item.price.toInt()} EGP',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: ColorM.primary,
                      ),
                    ),

                    // Quantity Stepper
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Decrement button (disabled when quantity <= 1 or when updating)
                          InkWell(
                            onTap: (!isUpdating && item.quantity > 1)
                                ? onDecrement
                                : null,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: (!isUpdating && item.quantity > 1)
                                    ? const Color(0xFFE5E7EB)
                                    : const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 14,
                                color: (!isUpdating && item.quantity > 1)
                                    ? const Color(0xFF4B5563)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                          ),

                          // Quantity text or spinner when updating
                          Container(
                            constraints: const BoxConstraints(minWidth: 26),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: isUpdating
                                ? const Center(
                                    child: SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: ColorM.primary,
                                      ),
                                    ),
                                  )
                                : Text(
                                    '${item.quantity}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1A1F36),
                                    ),
                                  ),
                          ),

                          // Increment button (disabled when updating)
                          InkWell(
                            onTap: !isUpdating ? onIncrement : null,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: isUpdating
                                    ? const Color(0xFFE5E7EB)
                                    : ColorM.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 14,
                                color: isUpdating
                                    ? const Color(0xFF9CA3AF)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
