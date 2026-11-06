import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/shimmer/shimmer.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. App Bar Skeleton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                child: Row(
                  children: [
                    const ShimmerBone.circle(size: 44),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerBone.text(width: 110, fontSize: 13),
                          SizedBox(height: 6),
                          ShimmerBone.text(width: 160, fontSize: 15),
                        ],
                      ),
                    ),
                    const ShimmerBone.circle(size: 40),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. Hero Banner Skeleton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                child: Container(
                  height: 148,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerBone.line(width: 80, height: 16),
                          SizedBox(height: 8),
                          ShimmerBone.text(width: 180, fontSize: 18),
                        ],
                      ),
                      ShimmerBone.line(width: 100, height: 32),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 3. Categories Skeleton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBone.text(width: 100, fontSize: 18),
                    ShimmerBone.text(width: 50, fontSize: 13),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 88,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                  itemCount: 5,
                  separatorBuilder: (_, _) => const SizedBox(width: 16),
                  itemBuilder: (_, _) => const Column(
                    children: [
                      ShimmerBone.circle(size: 60),
                      SizedBox(height: 8),
                      ShimmerBone.text(width: 48, fontSize: 11),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 4. Brands Skeleton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBone.text(width: 90, fontSize: 18),
                    ShimmerBone.text(width: 50, fontSize: 13),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 52,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                  itemCount: 4,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (_, _) => const ShimmerBone.line(
                    width: 110,
                    height: 48,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 5. Popular Products Skeleton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBone.text(width: 120, fontSize: 18),
                    ShimmerBone.text(width: 50, fontSize: 13),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                child: Row(
                  children: [
                    Expanded(child: _buildProductCardSkeleton()),
                    const SizedBox(width: 16),
                    Expanded(child: _buildProductCardSkeleton()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCardSkeleton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerBone(
            width: double.infinity,
            height: 120,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerBone.text(width: 60, fontSize: 11),
                const SizedBox(height: 6),
                const ShimmerBone.text(width: 110, fontSize: 14),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ShimmerBone.text(width: 50, fontSize: 15),
                    ShimmerBone.circle(size: 32),
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

