import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/shimmer/shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ShimmerLoading(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Top Image Area
                  const ShimmerBone(
                    width: double.infinity,
                    height: 382,
                  ),

                  // Sheet
                  Positioned.fill(
                    top: 340,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Center(
                              child: ShimmerBone.line(width: 44, height: 4),
                            ),
                            const SizedBox(height: 16),
                            const Row(
                              children: [
                                ShimmerBone.line(width: 70, height: 26, borderRadius: BorderRadius.all(Radius.circular(20))),
                                SizedBox(width: 8),
                                ShimmerBone.line(width: 70, height: 26, borderRadius: BorderRadius.all(Radius.circular(20))),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const ShimmerBone.text(width: 220, fontSize: 26),
                            const SizedBox(height: 12),
                            const ShimmerBone.text(width: 100, fontSize: 32),
                            const SizedBox(height: 16),
                            const Divider(height: 1),
                            const SizedBox(height: 16),
                            const ShimmerBone.text(width: 120, fontSize: 12),
                            const SizedBox(height: 10),
                            const ShimmerBone.text(width: double.infinity, fontSize: 14),
                            const SizedBox(height: 6),
                            const ShimmerBone.text(width: 250, fontSize: 14),
                            const Spacer(),
                            Row(
                              children: [
                                const ShimmerBone.line(width: 110, height: 50, borderRadius: BorderRadius.all(Radius.circular(16))),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: const ShimmerBone.line(height: 50, borderRadius: BorderRadius.all(Radius.circular(16))),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
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

