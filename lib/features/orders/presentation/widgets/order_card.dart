import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/presentation/widgets/order_status_badge.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
  });

  Widget _buildItemThumbnail(OrderItemPreview item) {
    Widget imageWidget;
    if (item.assetPath != null && item.assetPath!.isNotEmpty) {
      imageWidget = Image.asset(item.assetPath!, fit: BoxFit.contain);
    } else if (item.imageUrl != null && item.imageUrl!.startsWith('http')) {
      imageWidget = CachedNetworkImage(
        imageUrl: item.imageUrl!,
        fit: BoxFit.contain,
        placeholder: (_, __) => Container(color: const Color(0xFFF3F4F6)),
        errorWidget: (_, __, ___) => const Icon(
          Icons.fastfood_outlined,
          size: 20,
          color: ColorM.muted,
        ),
      );
    } else {
      imageWidget = const Icon(
        Icons.fastfood_outlined,
        size: 22,
        color: ColorM.muted,
      );
    }

    return Container(
      width: 52,
      height: 52,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: imageWidget),
    );
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Order # and Status badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Order #${order.orderNumber}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0A192F),
                  ),
                ),
                OrderStatusBadge(
                  status: order.status,
                  label: order.statusText,
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Date
            Text(
              order.date,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(height: 14),

            // Thumbnails preview row
            Row(
              children: [
                for (final item in order.previewItems) ...[
                  _buildItemThumbnail(item),
                  const SizedBox(width: 10),
                ],
              ],
            ),
            const SizedBox(height: 16),

            // Horizontal Divider
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFF3F4F6),
            ),
            const SizedBox(height: 14),

            // Bottom summary row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${order.itemCount} items · ${order.deliveryType}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                Text(
                  '${order.total.toInt()} EGP',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0A192F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

