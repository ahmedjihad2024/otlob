import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/shimmer/shimmer.dart';

class OrdersShimmerLoading extends StatelessWidget {
  const OrdersShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBone.text(width: 140, fontSize: 28),
            const SizedBox(height: 6),
            const ShimmerBone.text(width: 160, fontSize: 13),
            const SizedBox(height: 24),

            for (int i = 0; i < 3; i++) ...[
              _buildOrderCardSkeleton(),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCardSkeleton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerBone.text(width: 90, fontSize: 16),
              ShimmerBone.line(width: 80, height: 26, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ),
          const SizedBox(height: 8),
          const ShimmerBone.text(width: 110, fontSize: 12),
          const SizedBox(height: 14),
          const Divider(height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              const ShimmerBone.square(size: 48, borderRadius: BorderRadius.all(Radius.circular(12))),
              const SizedBox(width: 8),
              const ShimmerBone.square(size: 48, borderRadius: BorderRadius.all(Radius.circular(12))),
              const Spacer(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShimmerBone.text(width: 60, fontSize: 12),
                  SizedBox(height: 4),
                  ShimmerBone.text(width: 80, fontSize: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

