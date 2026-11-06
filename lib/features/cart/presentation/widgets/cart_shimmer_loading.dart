import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/shimmer/shimmer.dart';

class CartShimmerLoading extends StatelessWidget {
  const CartShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const ShimmerBone.text(width: 140, fontSize: 28),
            const SizedBox(height: 6),
            const ShimmerBone.text(width: 100, fontSize: 13),
            const SizedBox(height: 20),

            // Item cards
            for (int i = 0; i < 3; i++) ...[
              _buildCartItemSkeleton(),
              const SizedBox(height: 16),
            ],

            const SizedBox(height: 8),

            // Order Summary Skeleton
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBone.text(width: 120, fontSize: 18),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBone.text(width: 70, fontSize: 14),
                      ShimmerBone.text(width: 60, fontSize: 14),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBone.text(width: 80, fontSize: 14),
                      ShimmerBone.text(width: 50, fontSize: 14),
                    ],
                  ),
                  SizedBox(height: 14),
                  Divider(height: 1),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBone.text(width: 50, fontSize: 16),
                      ShimmerBone.text(width: 80, fontSize: 18),
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

  Widget _buildCartItemSkeleton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          ShimmerBone.square(size: 80, borderRadius: BorderRadius.all(Radius.circular(16))),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBone.text(width: 140, fontSize: 15),
                SizedBox(height: 6),
                ShimmerBone.text(width: 80, fontSize: 12),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBone.text(width: 70, fontSize: 16),
                    ShimmerBone.line(
                      width: 90,
                      height: 32,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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

