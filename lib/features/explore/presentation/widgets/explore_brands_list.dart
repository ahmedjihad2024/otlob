import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';

class ExploreBrandsList extends StatelessWidget {
  const ExploreBrandsList({
    super.key,
    required this.brands,
    this.onSelectBrand,
  });

  final List<BrandItem> brands;
  final ValueChanged<BrandItem>? onSelectBrand;

  @override
  Widget build(BuildContext context) {
    if (brands.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "BRANDS",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF9CA3AF),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final brand = brands[index];
            final initial = brand.name.trim().isNotEmpty
                ? brand.name.trim()[0].toUpperCase()
                : 'B';
            return InkWell(
              onTap: () => onSelectBrand?.call(brand),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF0ED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        initial,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorM.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      brand.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 16,
                      color: Color(0xFFD1D5DB),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
