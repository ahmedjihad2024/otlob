import 'package:flutter/material.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';

class OrderStatusBadge extends StatelessWidget {
  final OrderStatus status;
  final String? label;

  const OrderStatusBadge({
    super.key,
    required this.status,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor, defaultText) = switch (status) {
      OrderStatus.delivered => (
        const Color(0xFFE6F4EA),
        const Color(0xFF1E8E3E),
        'Delivered',
      ),
      OrderStatus.processing => (
        const Color(0xFFFFF3E0),
        const Color(0xFFE65100),
        'Processing',
      ),
      OrderStatus.shipped => (
        const Color(0xFFE8F0FE),
        const Color(0xFF1A73E8),
        'On the way',
      ),
      OrderStatus.cancelled => (
        const Color(0xFFFCE8E6),
        const Color(0xFFD93025),
        'Cancelled',
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label ?? defaultText,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
