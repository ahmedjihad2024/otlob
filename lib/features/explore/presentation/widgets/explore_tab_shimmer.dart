import 'package:flutter/material.dart';
import 'package:otlob/core/ui_kit/shimmer/shimmer.dart';

class ExploreTabShimmer extends StatelessWidget {
  const ExploreTabShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Categories Header Bone
          const ShimmerBone.text(width: 90, fontSize: 13),
          const SizedBox(height: 16),

          // 2. Categories Grid Bones
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 169 / 71.5,
            ),
            itemBuilder: (_, _) => const ShimmerBone(
              width: double.infinity,
              height: 54,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),

          const SizedBox(height: 28),

          // 3. Brands Header Bone
          const ShimmerBone.text(width: 70, fontSize: 13),
          const SizedBox(height: 16),

          // 4. Brands List Bones
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, _) => Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  ShimmerBone.circle(size: 48),
                  SizedBox(width: 16),
                  ShimmerBone.text(width: 100, fontSize: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

