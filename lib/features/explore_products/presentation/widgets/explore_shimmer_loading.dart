import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/shimmer/shimmer.dart';

class ExploreShimmerLoading extends StatelessWidget {
  const ExploreShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding, vertical: 12),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 171 / 244,
          ),
          itemCount: 6,
          itemBuilder: (_, _) => _buildItemSkeleton(),
        ),
      ),
    );
  }

  Widget _buildItemSkeleton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: ShimmerBone(
              width: double.infinity,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          const SizedBox(height: 10),
          const ShimmerBone.text(width: 50, fontSize: 11),
          const SizedBox(height: 6),
          const ShimmerBone.text(width: 100, fontSize: 13),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ShimmerBone.text(width: 45, fontSize: 14),
              ShimmerBone.circle(size: 28),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

