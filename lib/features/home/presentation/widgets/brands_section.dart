import 'package:flutter/material.dart';
import 'package:otlob/core/res/app_sizes.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({
    super.key,
    this.selectedBrand,
    this.onSelectBrand,
    this.brands = defaultBrands,
  });

  final String? selectedBrand;
  final ValueChanged<String>? onSelectBrand;
  final List<String> brands;

  static const List<String> defaultBrands = [
    'Starbucks',
    'Costa',
    'Cilantro',
    'TBS',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Text(
            "Brands",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
              letterSpacing: -0.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 46,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: brands.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final brand = brands[index];
              return InkWell(
                onTap: () => onSelectBrand?.call(brand),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFF3F4F6),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    brand,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
