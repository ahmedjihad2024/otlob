import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';

export 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({
    super.key,
    this.selectedBrand,
    this.onSelectBrand,
    this.brands = defaultBrands,
  });

  final String? selectedBrand;
  final ValueChanged<BrandItem>? onSelectBrand;
  final List<BrandItem> brands;

  static const List<BrandItem> defaultBrands = [
    BrandItem(id: 1, name: 'Starbucks'),
    BrandItem(id: 2, name: 'Costa'),
    BrandItem(id: 3, name: 'Cilantro'),
    BrandItem(id: 4, name: 'TBS'),
    BrandItem(id: 5, name: 'On The Run'),
    BrandItem(id: 6, name: 'Caribou'),
    BrandItem(id: 7, name: 'Krispy Kreme'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
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
            padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: brands.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final brand = brands[index];
              final isSelected = selectedBrand == brand.name ||
                  selectedBrand == brand.id.toString();
              return InkWell(
                onTap: () => onSelectBrand?.call(brand),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFFF6B4A) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFFF6B4A)
                          : const Color(0xFFF3F4F6),
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
                    brand.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : const Color(0xFF1F2937),
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
