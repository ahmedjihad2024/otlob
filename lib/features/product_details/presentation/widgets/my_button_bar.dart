import 'package:flutter/material.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/sizes_manager.dart';

class MyButtonBar extends StatelessWidget {
  const MyButtonBar({
    super.key,
    this.quantity = 1,
    this.unitPrice = 180,
    this.onDecrease,
    this.onIncrease,
    this.onAddToCart,
  });

  final int quantity;
  final int unitPrice;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    final total = unitPrice * quantity;

    return Container(
      padding: EdgeInsets.symmetric(
            horizontal: SizeM.pagePadding,
            vertical: 16,
          ) +
          EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 40,
            offset: const Offset(0, -10),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: quantity > 1 ? onDecrease : null,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF3F4F6),
                    fixedSize: const Size(36, 36),
                    padding: EdgeInsets.zero,
                  ),
                  icon: Icon(
                    Icons.remove,
                    size: 16,
                    color: quantity > 1
                        ? const Color(0xFF6B7280)
                        : const Color(0xFFD1D5DB),
                  ),
                ),
                SizedBox(
                  width: 24,
                  child: Text(
                    "$quantity",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onIncrease,
                  style: IconButton.styleFrom(
                    backgroundColor: ColorM.primary,
                    fixedSize: const Size(36, 36),
                    padding: EdgeInsets.zero,
                    elevation: 1,
                    shadowColor: const Color(0xFFFFCAC9),
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorM.primary,
                elevation: 6,
                shadowColor: ColorM.primary.withValues(alpha: .35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                fixedSize: const Size.fromHeight(56),
              ),
              child: Text(
                "Add to cart · $total EGP",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
